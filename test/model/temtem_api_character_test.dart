import 'dart:convert';

import 'package:temtem_api_wrapper/src/model/temtem_api_character.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../utils/fixture_reader.dart';

void main() {
  group('TemTemApiCharacter', () {
    final tJson = (jsonDecode(fixture('characters.json')) as Iterable)
        .cast<Map<String, dynamic>>();

    group('fromJson', () {
      test('parse characters.json', () {
        final characters = tJson.map(TemTemApiCharacter.fromJson);
        expect(characters.length, 1);

        final character = characters.first;
        expect(character.name, 'Lady Lottie');
        expect(character.wikiUrl, 'https://temtem.gamepedia.com/Lady_Lottie');
      });
    });
  });
}
