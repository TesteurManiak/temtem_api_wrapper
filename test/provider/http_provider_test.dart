import 'package:temtem_api_wrapper/src/api_provider.dart';
import 'package:temtem_api_wrapper/src/provider/http_provider.dart';
import 'package:test/test.dart';

import '../utils/mock_http_client.dart';

void main() {
  group('HttpProvider', () {
    final httpProvider = HttpProvider(client: mockClient);

    group('baseUri', () {
      test('should return the base uri', () {
        expect(HttpProvider.baseUri.toString(), HttpProvider.baseUrl);
      });
    });

    group('getTemtems', () {
      test('should return a list of temtems', () async {
        final temtems = await httpProvider.getTemtems();
        expect(temtems, isNotEmpty);
      });

      test('should return a list of temtems with the given names', () async {
        const tNames = ['Ganki', 'Mimit'];
        final temtems = (await httpProvider.getTemtems(names: tNames))
            .cast<Map<String, dynamic>>();
        expect(temtems, isNotEmpty);
        expect(
          temtems.every((temtem) => tNames.contains(temtem['name'])),
          isTrue,
        );
      });

      test('should return a list of temtems with the given expand', () async {
        final temtems =
            (await httpProvider.getTemtems(expand: ExpandableField.values))
                .cast<Map<String, dynamic>>();
        expect(temtems, isNotEmpty);
      });

      test('should return a list of temtems with the given weaknesses',
          () async {
        final temtems = (await httpProvider.getTemtems(weaknesses: true))
            .cast<Map<String, dynamic>>();
        expect(temtems, isNotEmpty);
        expect(temtems.every((temtem) => temtem['weaknesses'] != null), isTrue);
      });
    });
  });
}
