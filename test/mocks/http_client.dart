import 'package:collection/collection.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:temtem_api_wrapper/src/provider/api_client.dart';

import '../utils/fixture_reader.dart';

final mockClient = MockClient((request) async {
  if (request.method == 'GET') {
    const listEquality = ListEquality();

    final url = request.url;

    // Is the request for temtems
    if (listEquality
        .equals(url.pathSegments, ['api', 'freetem', 'Ganki', '30'])) {
      return Response(fixture('freetem_ganki.json'), 200);
    }
  }
  throw Response('{errorStatus: 404}', 404);
});

final mockApiClient = HttpClient(mockClient);
