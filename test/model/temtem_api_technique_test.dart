import 'dart:convert';

import 'package:temtem_api_wrapper/src/model/temtem_api_technique.dart';
import 'package:temtem_api_wrapper/src/provider/http_provider.dart';
import 'package:test/test.dart';

import '../utils/fixture_reader.dart';

void main() {
  group('SynergyEffect', () {
    group('hashCode', () {
      test('should be the same for 2 classes with same values', () {
        final synergyEffect1 = SynergyEffect(
          effect: '+20 Base Power',
          type: 'damage',
          damage: 20,
        );
        final synergyEffect2 = SynergyEffect(
          effect: '+20 Base Power',
          type: 'damage',
          damage: 20,
        );
        expect(synergyEffect1.hashCode, synergyEffect2.hashCode);
      });
    });
  });

  group('TemTemApiTechnique', () {
    final tJson = (jsonDecode(fixture('techniques.json')) as Iterable)
        .cast<Map<String, dynamic>>();

    group('fromJson', () {
      test('parse techniques.json', () {
        final techniques = tJson.map(TemTemApiTechnique.fromJson);
        expect(techniques.length, 1);

        final technique = techniques.first;
        expect(technique.name, 'Crystal Dust');
        expect(technique.wikiUrl, 'https://temtem.gamepedia.com/Crystal_Dust');
        expect(technique.type, 'Crystal');
        expect(technique.classTouch, 'Special');
        expect(technique.classIcon, '/images/icons/technique/Special.png');
        expect(technique.damage, 60);
        expect(technique.staminaCost, 11);
        expect(technique.hold, 0);
        expect(technique.priority, 'high');
        expect(technique.priorityIcon, '/images/icons/priority/high.png');
        expect(technique.synergy, 'Wind');
        expect(technique.synergyEffects, [
          SynergyEffect(effect: '+20 Base Power', type: 'damage', damage: 20),
          SynergyEffect(effect: '+1 Priority', type: 'priority', damage: 0),
        ]);
        expect(technique.targets, 'Single Other Target');
        expect(
          technique.description,
          'A miniature version of the "star-rain" that is said to have spawned the Archipelago.',
        );
      });
    });

    group('classIconUrl', () {
      test('returns the icon url', () {
        final technique = tJson.map(TemTemApiTechnique.fromJson).first;
        expect(
          technique.classIconUrl,
          '${HttpProvider.baseUrl}${technique.classIcon}',
        );
      });
    });

    group('priorityIconUrl', () {
      test('returns the icon url', () {
        final technique = tJson.map(TemTemApiTechnique.fromJson).first;
        expect(
          technique.priorityIconUrl,
          '${HttpProvider.baseUrl}${technique.priorityIcon}',
        );
      });
    });
  });
}
