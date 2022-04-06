import 'dart:convert';

import 'package:temtem_api_wrapper/src/model/temtem_api_technique.dart';
import 'package:test/test.dart';

import '../utils/fixture_reader.dart';

void main() {
  group('TemTemApiTechnique', () {
    group('fromJson', () {
      test('parse techniques.json', () {
        final json = (jsonDecode(fixture('techniques.json')) as Iterable)
            .cast<Map<String, dynamic>>();
        final techniques = json.map(TemTemApiTechnique.fromJson);
        expect(techniques.length, 1);
      });
    });
  });
}
