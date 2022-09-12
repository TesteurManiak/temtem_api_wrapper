import 'package:flutter/material.dart';
import 'package:temtem_api_wrapper/temtem_api_wrapper.dart';

class AllConditions extends StatefulWidget {
  final TemTemApi api;

  AllConditions(this.api);

  @override
  State<StatefulWidget> createState() => _AllConditionsState();
}

class _AllConditionsState extends State<AllConditions>
    with AutomaticKeepAliveClientMixin {
  Future<List<TemTemApiCondition>> _future;

  @override
  void initState() {
    super.initState();
    _future = widget.api.getConditions();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return FutureBuilder<List<TemTemApiCondition>>(
      future: _future,
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const CircularProgressIndicator();
        if (snapshot.data.isEmpty) {
          return const Center(child: Text('Empty conditions list'));
        }
        return ListView(
          children: [
            ...snapshot.data
                .map<Widget>(
                  (e) => ListTile(
                    title: Text(e.name),
                    subtitle:
                        Text(e.description, overflow: TextOverflow.ellipsis),
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
