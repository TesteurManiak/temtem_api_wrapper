import 'dart:convert';

import 'package:temtem_api_wrapper/src/model/temtem_api_cosmetic.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../utils/fixture_reader.dart';

void main() {
  group('TemTemApiCosmetic', () {
    group('fromJson', () {
      test('parse cosmetics.json', () {
        final json = (jsonDecode(fixture('cosmetics.json')) as Iterable)
            .cast<Map<String, dynamic>>();
        final cosmetics = json.map(TemTemApiCosmetic.fromJson);
        expect(cosmetics.length, 1);
      });
    });
  });
}
