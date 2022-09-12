import 'dart:convert';

import 'package:temtem_api_wrapper/src/model/temtem_api_dojo.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../utils/fixture_reader.dart';

void main() {
  group('TemTemApiDojo', () {
    group('fromJson', () {
      test('parse dojos.json', () {
        final json = (jsonDecode(fixture('dojos.json')) as Iterable)
            .cast<Map<String, dynamic>>();
        final dojos = json.map(TemTemApiDojo.fromJson).toList();
        expect(dojos.length, 1);
      });
    });
  });
}
