import 'dart:convert';

import 'package:temtem_api_wrapper/src/model/temtem_api_location.dart';
import 'package:test/test.dart';

import '../utils/fixture_reader.dart';

void main() {
  group('TemTemApiLocation', () {
    group('fromJson', () {
      test('parse locations.json', () {
        final json = (jsonDecode(fixture('locations.json')) as Iterable)
            .cast<Map<String, dynamic>>();
        final locations = json.map(TemTemApiLocation.fromJson);
        expect(locations.length, 1);
      });
    });
  });
}
