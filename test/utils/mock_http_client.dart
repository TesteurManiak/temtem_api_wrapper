import 'package:collection/collection.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:temtem_api_wrapper/src/api_provider.dart';

import 'fixture_reader.dart';

final mockClient = MockClient((request) async {
  if (request.method == 'GET') {
    const listEquality = ListEquality();

    // Is the request for temtems
    if (listEquality.equals(request.url.pathSegments, ['api', 'temtems'])) {
      final names = request.url.queryParameters['names']?.split(',');
      final expand = request.url.queryParameters['expand']?.split(',');
      final weaknesses = request.url.queryParameters['weaknesses'];

      if (listEquality.equals(names, ['Ganki', 'Mimit']) &&
          expand == null &&
          weaknesses == null) {
        final json = fixture('temtems_2.json');
        return Response(json, 200);
      } else if (listEquality.equals(names, ['Ganki']) &&
          listEquality.equals(
            expand,
            ExpandableField.values.map((e) => e.name).toList(),
          ) &&
          weaknesses == null) {
        final json = fixture('temtems_3.json');
        return Response(json, 200);
      } else if (names == null && expand == null && weaknesses != null) {
        final json = fixture('temtems_4.json');
        return Response(json, 200);
      }
      return Response(fixture('temtems.json'), 200);
    }
  }
  throw Response('{errorStatus: 404}', 404);
});
