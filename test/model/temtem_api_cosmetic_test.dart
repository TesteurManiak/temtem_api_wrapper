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

        final cosmetic = cosmetics.first;
        expect(cosmetic.type, 'bottom');
        expect(
          cosmetic.wikiImageUrl,
          'https://gamepedia.cursecdn.com/temtem_gamepedia_en/thumb/d/dc/TieDownPants.png/100px-TieDownPants.png',
        );
        expect(cosmetic.wikiUrl, 'https://temtem.gamepedia.com/Tie_Down_Pants');
        expect(cosmetic.name, 'Tie Down Pants');
        expect(cosmetic.location, 'Mokupuni');
        expect(cosmetic.cost, 24999);
        expect(cosmetic.requirement, '');
        expect(
          cosmetic.description,
          'Practical shorts, enhanced with tied rope details for a rustic touch.',
        );
      });
    });
  });
}
