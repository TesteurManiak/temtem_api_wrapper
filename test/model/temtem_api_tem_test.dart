import 'dart:convert';

import 'package:temtem_api_wrapper/src/model/temtem_api_tem/temtem_api_tem.dart';
import 'package:temtem_api_wrapper/src/provider/http_provider.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../utils/fixture_reader.dart';

void main() {
  group('TemTemApiTem', () {
    group('fromJson', () {
      test('parse temtems from temtems.json', () {
        final json = (jsonDecode(fixture('temtems.json')) as Iterable)
            .cast<Map<String, dynamic>>();
        final temtems = json.map(TemTemApiTem.fromJson);
        expect(temtems.length, 1);
      });

      test('parse temtem_113.json', () {
        final json =
            jsonDecode(fixture('temtem_113.json')) as Map<String, dynamic>;
        final temtem = TemTemApiTem.fromJson(json);

        expect(temtem.number, 113);
        expect(temtem.name, 'Ganki');
        expect(
          temtem.types,
          [Type.fromString('Electric'), Type.fromString('Wind')],
        );
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
        expect(
          temtem.traits,
          [
            Trait.fromString('Botanophobia'),
            Trait.fromString('Cold-Natured'),
          ],
        );
        expect(
          temtem.details,
          Details(
            heightCm: 105,
            heightInches: 41,
            weightKg: 14,
            weightLbs: 31,
          ),
        );
        expect(temtem.techniques?.length, 11);
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
        expect(temtem.locations?.length, 2);
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

  group('Details', () {
    group('hashCode', () {
      test('should be the same for 2 classes with same values', () {
        final details1 = Details(
          heightCm: 100,
          heightInches: 100,
          weightKg: 25,
          weightLbs: 25,
        );
        final details2 = Details(
          heightCm: 100,
          heightInches: 100,
          weightKg: 25,
          weightLbs: 25,
        );
        expect(details1.hashCode, details2.hashCode);
      });
    });
  });

  group('Evolution', () {
    group('hashCode', () {
      test('should be the same for 2 classes with same values', () {
        final evolution1 = Evolution(
          stage: 1,
          evolutionTree: [
            EvolutionNode(number: 1, name: '', stage: 1, traitMapping: {})
          ],
          evolves: true,
          type: 'level',
        );
        final evolution2 = Evolution(
          stage: 1,
          evolutionTree: [
            EvolutionNode(number: 1, name: '', stage: 1, traitMapping: {})
          ],
          evolves: true,
          type: 'level',
        );
        expect(evolution1.hashCode, evolution2.hashCode);
      });
    });
  });

  group('EvolutionNode', () {
    group('hashCode', () {
      test('should be the same for 2 classes with same values', () {
        final node1 = EvolutionNode(
          number: 1,
          name: 'Temtem',
          stage: 1,
          traitMapping: {},
        );
        final node2 = EvolutionNode(
          number: 1,
          name: 'Temtem',
          stage: 1,
          traitMapping: {},
        );
        expect(node1.hashCode, node2.hashCode);
      });
    });
  });

  group('GenderRatio', () {
    group('hashCode', () {
      test('should be the same for 2 classes with same values', () {
        final ratio1 = GenderRatio(male: 50, female: 50);
        final ratio2 = GenderRatio(male: 50, female: 50);
        expect(ratio1.hashCode, ratio2.hashCode);
      });
    });
  });

  group('Stats', () {
    group('total', () {
      test(
          'if indicated, should be calculated from hp, sta, spd, atk, def, spatk, spdef',
          () {
        final stats = Stats(
          hp: 38,
          sta: 46,
          spd: 61,
          atk: 57,
          def: 38,
          spatk: 62,
          spdef: 73,
        );
        expect(stats.total, 375);
      });
    });

    group('hashCode', () {
      test('should be the same for 2 classes with same values', () {
        final stats1 = Stats(
          hp: 38,
          sta: 46,
          spd: 61,
          atk: 57,
          def: 38,
          spatk: 62,
          spdef: 73,
        );
        final stats2 = Stats(
          hp: 38,
          sta: 46,
          spd: 61,
          atk: 57,
          def: 38,
          spatk: 62,
          spdef: 73,
        );
        expect(stats1.hashCode, stats2.hashCode);
      });
    });
  });

  group('Technique', () {
    group('classIconUrl', () {
      test('should return the correct url', () {
        final technique = Technique(
          name: '',
          wikiUrl: '',
          type: '',
          classTouch: '',
          classIcon: null,
          source: '',
          levels: null,
          damage: null,
          effects: null,
          priority: null,
          synergyEffects: null,
          synergy: null,
          description: null,
          priorityIcon: null,
          staminaCost: null,
          effectText: null,
          targets: null,
          hold: null,
        );
        expect(technique.classIconUrl, isNull);
      });
    });
  });

  group('Trait', () {
    group('hashCode', () {
      test('should be the same for 2 classes with same values', () {
        final trait1 = Trait(
          name: 'Temtem',
          wikiUrl: 'https://temtem.gamepedia.com/Temtem',
          description: '',
          effect: '',
        );
        final trait2 = Trait(
          name: 'Temtem',
          wikiUrl: 'https://temtem.gamepedia.com/Temtem',
          description: '',
          effect: '',
        );
        expect(trait1.hashCode, trait2.hashCode);
      });
    });
  });

  group('Type', () {
    final tType = Type(
      name: 'Electric',
      icon: '/images/icons/types/Electric.png',
    );

    group('iconUrl', () {
      test('should return the correct url', () {
        expect(
          tType.iconUrl,
          HttpProvider.baseUri.replace(path: tType.icon).toString(),
        );
      });
    });

    group('hashCode', () {
      test('should be the same for 2 classes with same values', () {
        final type2 = Type(
          name: 'Electric',
          icon: '/images/icons/types/Electric.png',
        );
        expect(tType.hashCode, type2.hashCode);
      });
    });
  });
}
