import 'dart:convert';

import 'package:temtem_api_wrapper/src/model/temtem_api_location.dart';
import 'package:test/test.dart';

import '../utils/fixture_reader.dart';

void main() {
  group('TemTemApiLocation', () {
    group('fromJson', () {
      test('parse locations.json', () {
        final json = (jsonDecode(fixture('locations.json')) as Iterable)
            .cast<Map<String, dynamic>>();
        final locations = json.map(TemTemApiLocation.fromJson);
        expect(locations.length, 1);

        final location = locations.first;
        expect(location.name, 'Deniz');
        expect(location.wikiUrl, 'https://temtem.gamepedia.com/Deniz');
        expect(
          location.description,
          'Deniz is a Mediterranean paradise of glittering seas where Water and Wind Temtem abound. Walk the streets of Turquesa, explore the ruins of an ancient fort or just chill on the shores of Indigo Lake.',
        );
        expect(location.temtemTypes, ['Water', 'Wind']);
        expect(location.type, 'island');
      });
    });
  });
}
