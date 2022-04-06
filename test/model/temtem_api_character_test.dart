import 'dart:convert';

import 'package:temtem_api_wrapper/src/model/temtem_api_character.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../utils/fixture_reader.dart';

void main() {
  group('TemTemApiCharacter', () {
    group('fromJson', () {
      test('parse characters.json', () {
        final json = (jsonDecode(fixture('characters.json')) as Iterable)
            .cast<Map<String, dynamic>>();
        final characters = json.map(TemTemApiCharacter.fromJson);
        expect(characters.length, 1);
      });
    });
  });
}
