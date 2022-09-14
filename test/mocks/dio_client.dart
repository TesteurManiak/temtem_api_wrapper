import 'dart:convert';

import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:temtem_api_wrapper/src/provider/api_client.dart';
import 'package:temtem_api_wrapper/src/provider/http_provider.dart';
import 'package:temtem_api_wrapper/temtem_api_wrapper.dart';

import '../utils/fixture_reader.dart';

const _temtemsUrl = '${HttpProvider.baseUrl}/api/temtems';

class MockDioClient extends DioClient {
  MockDioClient() {
    final dioAdapter = DioAdapter(dio: client);

    dioAdapter.onGet(
      '$_temtemsUrl?',
      (server) => server.reply(200, jsonDecode(fixture('temtems.json'))),
    );
    dioAdapter.onGet(
      '$_temtemsUrl?names=${Uri.encodeComponent('Ganki,Mimit')}',
      (server) => server.reply(200, jsonDecode(fixture('temtems_2.json'))),
    );
    dioAdapter.onGet(
      '$_temtemsUrl?expand=${Uri.encodeComponent(ExpandableField.values.map((e) => e.name).join(','))}',
      (server) => server.reply(200, jsonDecode(fixture('temtems_3.json'))),
    );
    dioAdapter.onGet(
      '$_temtemsUrl?weaknesses=true',
      (server) => server.reply(200, jsonDecode(fixture('temtems_4.json'))),
    );
  }
}
