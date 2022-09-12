import 'dart:convert';

import 'package:temtem_api_wrapper/src/model/temtem_api_quest.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../utils/fixture_reader.dart';

void main() {
  group('TemTemApiQuest', () {
    group('fromJson', () {
      test('parse quests.json', () {
        final json = (jsonDecode(fixture('quests.json')) as Iterable)
            .cast<Map<String, dynamic>>();
        final quests = json.map(TemTemApiQuest.fromJson).toList();
        expect(quests.length, 2);
      });
    });
  });
}
