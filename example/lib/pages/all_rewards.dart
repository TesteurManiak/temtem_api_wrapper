import 'package:flutter/material.dart';
import 'package:temtem_api_wrapper/temtem_api_wrapper.dart';

class AllRewards extends StatefulWidget {
  final TemTemApi api;

  AllRewards(this.api);

  @override
  State<StatefulWidget> createState() => _AllRewardsState();
}

class _AllRewardsState extends State<AllRewards>
    with AutomaticKeepAliveClientMixin {
  late final Future<List<TemTemApiRewards>> _future;

  @override
  void initState() {
    super.initState();
    _future = widget.api.getFreeTemRewards();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return FutureBuilder<List<TemTemApiRewards>>(
      future: _future,
      builder: (context, snapshot) {
        final data = snapshot.data;
        if (!snapshot.hasData || data == null) {
          return const CircularProgressIndicator();
        }
        if (data.isEmpty) {
          return const Center(child: Text('Empty rewards list'));
        }
        return ListView(
          children: [
            ...data
                .map<Widget>(
                  (e) => ListTile(
                    leading: Image.network(e.wikiImageUrl),
                    title: Text(e.name),
                  ),
                )
                .toList(),
          ],
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
