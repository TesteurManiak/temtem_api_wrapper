import 'package:temtem_api_wrapper/src/api_provider.dart';
import 'package:temtem_api_wrapper/src/provider/http_provider.dart';
import 'package:test/test.dart';

import '../utils/mock_http_client.dart';

void main() {
  group('HttpProvider', () {
    final httpProvider = HttpProvider(client: mockClient);

    group('baseUri', () {
      test('return the base uri', () {
        expect(HttpProvider.baseUri.toString(), HttpProvider.baseUrl);
      });
    });

    group('getTemtems', () {
      test('return a list of temtems', () async {
        final temtems = await httpProvider.getTemtems(
          expand: [],
          names: [],
          weaknesses: false,
        );
        expect(temtems, isNotEmpty);
      });

      test('return a list of temtems with the given names', () async {
        const tNames = ['Ganki', 'Mimit'];
        final temtems = (await httpProvider.getTemtems(
          names: tNames,
          expand: [],
          weaknesses: false,
        ))
            .cast<Map<String, dynamic>>();
        expect(temtems, isNotEmpty);
        expect(
          temtems.every((temtem) => tNames.contains(temtem['name'])),
          isTrue,
        );
      });

      test('return a list of temtems with the given expand', () async {
        final temtems = (await httpProvider.getTemtems(
          expand: ExpandableField.values,
          weaknesses: false,
          names: [],
        ))
            .cast<Map<String, dynamic>>();
        expect(temtems, isNotEmpty);
      });

      test('return a list of temtems with the given weaknesses', () async {
        final temtems = (await httpProvider.getTemtems(
          weaknesses: true,
          names: [],
          expand: [],
        ))
            .cast<Map<String, dynamic>>();
        expect(temtems, isNotEmpty);
        expect(temtems.every((temtem) => temtem['weaknesses'] != null), isTrue);
      });
    });

    group('getTemtem', () {
      test('return info for temtem 113', () async {
        final temtem = await httpProvider.getTemtem(
          id: 113,
          expand: [],
          weaknesses: false,
        );
        expect(temtem, isNotNull);
        expect(temtem['number'], 113);
      });

      test('return expanded info for temtem 113', () async {
        final temtem = await httpProvider.getTemtem(
          id: 113,
          expand: ExpandableField.values,
          weaknesses: false,
        );
        expect(temtem, isNotNull);
        expect(temtem['number'], 113);

        final techniques = temtem['techniques'] as Iterable?;
        expect(techniques, isNotNull);
        expect(techniques?.length, 12);

        final traits = temtem['traits'] as Iterable?;
        expect(traits, isNotNull);

        final types = temtem['types'] as Iterable?;
        expect(types, isNotNull);
        expect(types?.length, 2);
      });

      test('return weaknesses info for temtem 113', () async {
        final temtem = await httpProvider.getTemtem(
          id: 113,
          expand: [],
          weaknesses: true,
        );
        expect(temtem, isNotNull);
        expect(temtem['number'], 113);
        expect(temtem['weaknesses'], isNotNull);
      });
    });
  });
}
