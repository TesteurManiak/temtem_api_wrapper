import 'package:flutter/material.dart';
import 'package:temtem_api_wrapper/temtem_api_wrapper.dart';

class AllTypes extends StatefulWidget {
  final TemTemApi api;

  AllTypes(this.api);

  @override
  State<StatefulWidget> createState() => _AllTypesState();
}

class _AllTypesState extends State<AllTypes>
    with AutomaticKeepAliveClientMixin {
  Future<List<TemTemApiType>> _future;

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
        if (!snapshot.hasData) return const CircularProgressIndicator();
        return ListView(
          children: [
            ...snapshot.data
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
