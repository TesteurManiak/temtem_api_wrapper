import 'dart:convert';

import 'package:temtem_api_wrapper/src/model/temtem_api_item.dart';
import 'package:test/test.dart';

import '../utils/fixture_reader.dart';

void main() {
  group('TemTemApiItem', () {
    group('fromJson', () {
      test('parse items.json', () {
        final json = (jsonDecode(fixture('items.json')) as Iterable)
            .cast<Map<String, dynamic>>();
        final items = json.map(TemTemApiItem.fromJson).toList();
        expect(items.length, 7);
      });
    });
  });
}
