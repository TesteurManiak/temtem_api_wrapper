import 'dart:convert';

import 'package:temtem_api_wrapper/src/model/temtem_api_gear.dart';
import 'package:test/test.dart';

import '../utils/fixture_reader.dart';

void main() {
  group('TemTemApiGear', () {
    group('fromJson', () {
      test('parse gears.json', () {
        final json = (jsonDecode(fixture('gear.json')) as Iterable)
            .cast<Map<String, dynamic>>();
        final gears = json.map(TemTemApiGear.fromJson).toList();
        expect(gears.length, 1);
      });
    });
  });
}
