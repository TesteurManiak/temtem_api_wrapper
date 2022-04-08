import 'dart:convert';

import 'package:temtem_api_wrapper/src/model/temtem_api_type.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../utils/fixture_reader.dart';

void main() {
  group('TemTemApiType', () {
    group('fromJson', () {
      test('parse types.json', () {
        final json = (jsonDecode(fixture('types.json')) as Iterable)
            .cast<Map<String, dynamic>>();
        final types = json.map(TemTemApiType.fromJson).toList();
        expect(types.length, 1);
      });
    });

    group('iconUrl', () {
      test('url should be completed with icon', () {
        final json = (jsonDecode(fixture('types.json')) as Iterable)
            .cast<Map<String, dynamic>>();
        final type = json.map(TemTemApiType.fromJson).first;
        expect(type.iconUrl, 'https://temtem-api.mael.tech${type.icon}');
      });
    });
  });
}
