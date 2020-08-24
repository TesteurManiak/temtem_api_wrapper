import 'package:flutter/material.dart';
import 'package:temtem_api_wrapper/temtem_api_wrapper.dart';

class AllTemtems extends StatefulWidget {
  final TemTemApi api;

  AllTemtems(this.api);

  @override
  State<StatefulWidget> createState() => _AllTemtemsState();
}

class _AllTemtemsState extends State<AllTemtems>
    with AutomaticKeepAliveClientMixin {
  Future<List<TemTemApiTem>> _future;

  @override
  void initState() {
    super.initState();
    _future = widget.api.getTemTems();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return FutureBuilder<List<TemTemApiTem>>(
      future: _future,
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const CircularProgressIndicator();
        return ListView(
          children: [
            ...snapshot.data.map<Widget>(
              (e) => ListTile(
                leading: Image.network(e.portraitWikiUrl),
                title: Text(e.name),
              ),
            )
          ],
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
