import 'dart:convert';

import 'package:temtem_api_wrapper/src/model/temtem_api_freetem.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../utils/fixture_reader.dart';

void main() {
  group('TemTemApiFreetem', () {
    group('fromJson', () {
      test('parse freetem_ganki.json', () {
        final json =
            jsonDecode(fixture('freetem_ganki.json')) as Map<String, dynamic>;
        final freetem = TemTemApiFreetem.fromJson(json);

        expect(freetem.temtem, 'Ganki');
        expect(freetem.level, 30);
        expect(freetem.catchRate, 120);
        expect(freetem.reward, 95);
      });
    });
  });
}
