import 'package:collection/collection.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:temtem_api_wrapper/src/api_provider.dart';

import 'fixture_reader.dart';

final mockClient = MockClient((request) async {
  if (request.method == 'GET') {
    const listEquality = ListEquality();

    final url = request.url;

    // Is the request for temtems
    if (listEquality.equals(url.pathSegments, ['api', 'temtems'])) {
      final names = url.queryParameters['names']?.split(',');
      final expand = url.queryParameters['expand']?.split(',');
      final weaknesses = url.queryParameters['weaknesses'];

      if (listEquality.equals(names, ['Ganki', 'Mimit']) &&
          expand == null &&
          weaknesses == null) {
        return Response(fixture('temtems_2.json'), 200);
      } else if (listEquality.equals(names, ['Ganki']) &&
          listEquality.equals(
            expand,
            ExpandableField.values.map((e) => e.name).toList(),
          ) &&
          weaknesses == null) {
        return Response(fixture('temtems_3.json'), 200);
      } else if (names == null && expand == null && weaknesses != null) {
        return Response(fixture('temtems_4.json'), 200);
      }
      return Response(fixture('temtems.json'), 200);
    } else if (listEquality
        .equals(url.pathSegments, ['api', 'temtems', '113'])) {
      final expand = url.queryParameters['expand'];
      final weaknesses = url.queryParameters['weaknesses'];

      if (expand != null && weaknesses == null) {
        return Response(fixture('temtem_113_expanded.json'), 200);
      }

      return Response(fixture('temtem_113.json'), 200);
    }
  }
  throw Response('{errorStatus: 404}', 404);
});
