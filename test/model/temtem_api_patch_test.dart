import 'dart:convert';

import 'package:temtem_api_wrapper/src/model/temtem_api_patch.dart';
import 'package:test/test.dart';

import '../utils/fixture_reader.dart';

void main() {
  group('TemTemApiPatch', () {
    group('fromJson', () {
      test('parse patches.json', () {
        final json = (jsonDecode(fixture('patches.json')) as Iterable)
            .cast<Map<String, dynamic>>();
        final patches = json.map(TemTemApiPatch.fromJson);
        expect(patches.length, 1);
      });
    });
  });
}
