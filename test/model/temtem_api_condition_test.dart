import 'dart:convert';

import 'package:temtem_api_wrapper/src/model/temtem_api_condition.dart';
import 'package:temtem_api_wrapper/src/provider/http_provider.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../utils/fixture_reader.dart';

void main() {
  group('TemTemApiCondition', () {
    final tJson = (jsonDecode(fixture('conditions.json')) as Iterable)
        .cast<Map<String, dynamic>>();

    group('fromJson', () {
      test('parse conditions.json', () {
        final conditions = tJson.map(TemTemApiCondition.fromJson);
        expect(conditions.length, 1);

        final condition = conditions.first;
        expect(condition.name, 'Cold');
        expect(
          condition.description,
          'If Cold is afflicted twice, the Temtem becomes Frozen. Frozen Temtem cannot attack, but they can rest normally. Cold and Frozen also serve to erase the Burnt Condition from a Temtem, while Burnt erases both Cold and Frozen',
        );
        expect(condition.icon, '/images/icons/conditions/Cold.png');
      });
    });

    group('iconUrl', () {
      test('returns the icon url', () {
        final conditions = tJson.map(TemTemApiCondition.fromJson);
        final condition = conditions.first;
        expect(
          condition.iconUrl,
          '${HttpProvider.baseUrl}${condition.icon}',
        );
      });
    });
  });
}
