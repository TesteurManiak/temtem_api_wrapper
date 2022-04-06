import 'dart:convert';

import 'package:temtem_api_wrapper/src/model/temtem_api_saipark.dart';
import 'package:test/test.dart';

import '../utils/fixture_reader.dart';

void main() {
  group('TemTemApiSaipark', () {
    group('fromJson', () {
      test('parse saipark.json', () {
        final json = (jsonDecode(fixture('saipark.json')) as Iterable)
            .cast<Map<String, dynamic>>();
        final parks = json.map(TemTemApiSaipark.fromJson).toList();
        expect(parks.length, 1);
      });
    });
  });
}
