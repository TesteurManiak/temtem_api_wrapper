import 'dart:convert';

import 'package:temtem_api_wrapper/src/model/temtem_api_dye.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../utils/fixture_reader.dart';

void main() {
  group('TemTemApiDye', () {
    group('fromJson', () {
      test('parse dyes.json', () {
        final json = (jsonDecode(fixture('dyes.json')) as Iterable)
            .cast<Map<String, dynamic>>();
        final dyes = json.map(TemTemApiDye.fromJson).toList();
        expect(dyes.length, 1);
      });
    });
  });
}
