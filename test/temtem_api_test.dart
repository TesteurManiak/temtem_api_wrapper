import 'package:temtem_api_wrapper/src/api_provider.dart';
import 'package:temtem_api_wrapper/src/temtem_api.dart';
import 'package:test/test.dart';

import 'utils/mock_http_provider.dart';

void main() {
  final mockHttpProvider = MockHttpProvider();

  group('TemTemApi', () {
    final temtemApi = TemTemApi(provider: mockHttpProvider);

    group('getTemTems', () {
      test('should return a list of temtems', () async {
        final temtems = await temtemApi.getTemTems();
        expect(temtems, isNotEmpty);
      });

      test('should return a list of temtems with the given names', () async {
        const tNames = ['Ganki', 'Mimit'];
        final temtems = await temtemApi.getTemTems(names: tNames);
        expect(temtems, isNotEmpty);
        expect(
          temtems.every((temtem) => tNames.contains(temtem.name)),
          isTrue,
        );
      });

      test('should return a list of temtems with the given expand', () async {
        final temtems =
            await temtemApi.getTemTems(expand: ExpandableField.values);
        expect(temtems, isNotEmpty);
      });

      test('should return a list of temtems with the given weaknesses',
          () async {
        final temtems = await temtemApi.getTemTems(weaknesses: true);
        expect(temtems, isNotEmpty);
        expect(temtems.every((temtem) => temtem.weaknesses != null), isTrue);
      });
    });

    group('getTemTem', () {
      test('should return temtem 113', () async {
        final temtem = await temtemApi.getTemTem(113);
        expect(temtem, isNotNull);
      });

      test('should return a temtem with the given expand', () async {
        final temtem =
            await temtemApi.getTemTem(113, expand: ExpandableField.values);
        expect(temtem, isNotNull);
      });

      test('should return a temtem with the given weaknesses', () async {
        final temtem = await temtemApi.getTemTem(113, weaknesses: true);
        expect(temtem, isNotNull);
        expect(temtem.weaknesses != null, isTrue);
      });
    });

    group('getFreetem', () {});
  });
}
