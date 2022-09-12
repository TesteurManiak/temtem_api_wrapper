import 'package:flutter/material.dart';
import 'package:temtem_api_wrapper/temtem_api_wrapper.dart';

class AllTypes extends StatefulWidget {
  final TemTemApi api;

  const AllTypes(this.api, {super.key});

  @override
  State<StatefulWidget> createState() => _AllTypesState();
}

class _AllTypesState extends State<AllTypes>
    with AutomaticKeepAliveClientMixin {
  late final Future<List<TemTemApiType>> _future;

  @override
  void initState() {
    super.initState();
    _future = widget.api.getTypes();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return FutureBuilder<List<TemTemApiType>>(
      future: _future,
      builder: (context, snapshot) {
        final data = snapshot.data;
        if (!snapshot.hasData || data == null) {
          return const CircularProgressIndicator();
        }
        return ListView(
          children: [
            ...data
                .map(
                  (e) => ListTile(
                    leading: Image.network(e.iconUrl),
                    title: Text(e.name),
                  ),
                )
                .toList()
          ],
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
