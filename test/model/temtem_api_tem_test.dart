import 'dart:convert';

import 'package:temtem_api_wrapper/src/model/temtem_api_tem.dart';
import 'package:test/scaffolding.dart';

import '../utils/fixture_reader.dart';

void main() {
  group('TemTemApiTem', () {
    group('fromJson', () {
      test('parse temtems from temtems.json', () {
        final json = (jsonDecode(fixture('temtems.json')) as Iterable)
            .cast<Map<String, dynamic>>();
        for (final e in json) {
          TemTemApiTem.fromJson(e);
        }
      });
    });
  });
}
