import 'dart:convert';

import 'package:temtem_api_wrapper/src/model/temtem_api_tem/temtem_api_tem.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../utils/fixture_reader.dart';

void main() {
  group('TemTemApiTem', () {
    group('fromJson', () {
      test('parse temtems from temtems.json', () {
        final json = (jsonDecode(fixture('temtems.json')) as Iterable)
            .cast<Map<String, dynamic>>();
        for (final e in json) {
          TemTemApiTem.fromJson(e);
        }
      });

      test('parse temtem_113.json', () {
        final json =
            jsonDecode(fixture('temtem_113.json')) as Map<String, dynamic>;
        final temtem = TemTemApiTem.fromJson(json);

        expect(temtem.number, 113);
        expect(temtem.name, 'Ganki');
        expect(temtem.types, ['Electric', 'Wind']);
        expect(
          temtem.portraitWikiUrl,
          'https://gamepedia.cursecdn.com/temtem_gamepedia_en/thumb/b/bc/Ganki.png/50px-Ganki.png',
        );
        expect(temtem.wikiUrl, 'https://temtem.gamepedia.com/Ganki');
        expect(
          temtem.stats,
          Stats(
            hp: 38,
            sta: 46,
            spd: 61,
            atk: 57,
            def: 38,
            spatk: 62,
            spdef: 73,
            total: 375,
          ),
        );
        expect(temtem.traits, ['Botanophobia', 'Cold-Natured']);
        expect(
          temtem.details,
          Details(
            heightCm: 105,
            heightInches: 41,
            weightKg: 14,
            weightLbs: 31,
          ),
        );
        expect(temtem.techniques.length, 11);
        expect(temtem.trivia.length, 4);
        expect(
          temtem.evolution,
          Evolution(
            stage: 1,
            evolutionTree: [
              EvolutionNode(
                number: 113,
                name: 'Ganki',
                stage: 1,
                levels: 27,
                trading: false,
                traitMapping: {
                  'Botanophobia': 'Receptive',
                  'Cold-Natured': 'Fast Charge'
                },
              ),
              EvolutionNode(
                number: 114,
                name: 'Gazuma',
                stage: 2,
                traitMapping: {
                  'Receptive': 'Receptive',
                  'Fast Charge': 'Fast Charge'
                },
              ),
            ],
            evolves: true,
            type: 'level',
          ),
        );
        expect(
          temtem.wikiPortraitUrlLarge,
          'https://gamepedia.cursecdn.com/temtem_gamepedia_en/thumb/b/bc/Ganki.png/250px-Ganki.png?version=d18706728e9cc3706caea19e24063ac4',
        );
        expect(temtem.locations.length, 2);
        expect(temtem.icon, '/images/portraits/temtem/large/Ganki.png');
        expect(
          temtem.lumaIcon,
          '/images/portraits/temtem/luma/large/Ganki.png',
        );
        expect(temtem.genderRatio, GenderRatio(male: 50, female: 50));
        expect(temtem.catchRate, 120);
        expect(temtem.hatchMins, 21);
        expect(
          temtem.tvYields,
          Stats(hp: 0, sta: 0, spd: 0, atk: 1, def: 0, spatk: 0, spdef: 0),
        );
        expect(
          temtem.gameDescription,
          'Many Cipanki legends mention the kind but powerful Ganki as mountain spirits, mythologically related to lightning and whirlwinds. Although they are no longer revered as kami, the Cipanki still appreciate and breed them.',
        );
        expect(temtem.wikiRenderStaticUrl, '');
        expect(temtem.wikiRenderAnimatedUrl, '');
        expect(temtem.wikiRenderStaticLumaUrl, '');
        expect(temtem.wikiRenderAnimatedLumaUrl, '');
        expect(temtem.renderStaticImage, '');
        expect(temtem.renderStaticLumaImage, '');
        expect(temtem.renderAnimatedImage, '');
        expect(temtem.renderAnimatedLumaImage, '');
      });
    });
  });
}
