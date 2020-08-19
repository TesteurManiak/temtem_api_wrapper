import 'package:flutter/material.dart';
import 'package:temtem_api_wrapper/temtem_api_wrapper.dart';

class AllRewards extends StatefulWidget {
  final TemTemApi api;

  AllRewards(this.api);

  @override
  State<StatefulWidget> createState() => _AllRewardsState();
}

class _AllRewardsState extends State<AllRewards> {
  Future<List<TemTemApiRewards>> _future;

  @override
  void initState() {
    super.initState();
    _future = widget.api.getFreeTemRewards();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<TemTemApiRewards>>(
      future: _future,
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const CircularProgressIndicator();
        if (snapshot.data.isEmpty) {
          return const Center(child: Text('Empty rewards list'));
        }
        return ListView(
          children: [
            ...snapshot.data
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
}
