import 'dart:convert';

import 'package:temtem_api_wrapper/src/model/temtem_api_condition.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../utils/fixture_reader.dart';

void main() {
  group('TemTemApiCondition', () {
    group('fromJson', () {
      test('parse conditions.json', () {
        final json = (jsonDecode(fixture('conditions.json')) as Iterable)
            .cast<Map<String, dynamic>>();
        final conditions = json.map(TemTemApiCondition.fromJson);
        expect(conditions.length, 1);
      });
    });
  });
}
