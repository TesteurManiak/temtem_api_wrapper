import 'dart:convert';

import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:temtem_api_wrapper/src/provider/api_client.dart';
import 'package:temtem_api_wrapper/src/provider/http_provider.dart';

import '../utils/fixture_reader.dart';

class MockDioClient extends DioClient {
  MockDioClient() {
    final dioAdapter = DioAdapter(dio: client);

    dioAdapter.onGet(
      '${HttpProvider.baseUrl}/api/temtems?',
      (server) => server.reply(200, jsonDecode(fixture('temtems.json'))),
    );
  }
}
