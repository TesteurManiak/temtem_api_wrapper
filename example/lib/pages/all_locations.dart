import 'package:flutter/material.dart';
import 'package:temtem_api_wrapper/temtem_api_wrapper.dart';

class AllLocations extends StatefulWidget {
  final TemTemApi api;

  AllLocations(this.api);

  @override
  State<StatefulWidget> createState() => _AllLocationsState();
}

class _AllLocationsState extends State<AllLocations>
    with AutomaticKeepAliveClientMixin {
  late final Future<List<TemTemApiLocation>> _future;

  @override
  void initState() {
    super.initState();
    _future = widget.api.getLocations();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return FutureBuilder<List<TemTemApiLocation>>(
      future: _future,
      builder: (context, snapshot) {
        final data = snapshot.data;
        if (!snapshot.hasData || data == null)
          return const CircularProgressIndicator();
        return ListView(
          children: [
            ...data.map(
              (e) {
                final imageWikiThumbnail = e.imageWikiThumbnail;
                return ListTile(
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () => showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: Text(e.name),
                      content: imageWikiThumbnail != null
                          ? Image.network(imageWikiThumbnail)
                          : null,
                    ),
                  ),
                  title: Text(e.name),
                  subtitle: Text(
                    e.description,
                    overflow: TextOverflow.ellipsis,
                  ),
                );
              },
            ).toList(),
          ],
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
