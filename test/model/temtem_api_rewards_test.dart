import 'dart:convert';

import 'package:temtem_api_wrapper/src/model/temtem_api_rewards.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../utils/fixture_reader.dart';

void main() {
  group('TemTemApiRewards', () {
    group('fromJson', () {
      test('parse rewards.json', () {
        final json = (jsonDecode(fixture('rewards.json')) as Iterable)
            .cast<Map<String, dynamic>>();
        final rewards = json.map(TemTemApiRewards.fromJson);
        expect(rewards.length, 1);

        final reward = rewards.first;
        expect(reward.name, 'Telomere Hack - SPD');
        expect(reward.quantity, 2);
        expect(
          reward.wikiUrl,
          'https://temtem.gamepedia.com/Telomere_Hack_-_SPD',
        );
      });
    });
  });
}
