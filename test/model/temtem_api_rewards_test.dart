import 'dart:convert';

import 'package:temtem_api_wrapper/src/model/temtem_api_rewards.dart';
import 'package:test/scaffolding.dart';

import '../utils/fixture_reader.dart';

void main() {
  group('TemTemApiRewards', () {
    group('fromJson', () {
      test('parse rewards.json', () {
        final json = (jsonDecode(fixture('rewards.json')) as Iterable)
            .cast<Map<String, dynamic>>();
        for (final e in json) {
          TemTemApiRewards.fromJson(e);
        }
      });
    });
  });
}
