import 'dart:convert';

import 'package:temtem_api_wrapper/src/model/temtem_api_patch.dart';
import 'package:test/test.dart';

import '../utils/fixture_reader.dart';

void main() {
  group('TemTemApiPatch', () {
    group('fromJson', () {
      test('parse patches.json', () {
        final json = (jsonDecode(fixture('patches.json')) as Iterable)
            .cast<Map<String, dynamic>>();
        final patches = json.map(TemTemApiPatch.fromJson);
        expect(patches.length, 1);

        final patch = patches.first;
        expect(patch.name, 'Temtem 0.5.5');
        expect(patch.url, 'https://crema.gg/temtem/temtem-0-5-5/');
        expect(
          patch.date.millisecondsSinceEpoch,
          DateTime(2020, 1, 25).millisecondsSinceEpoch,
        );
        expect(
          patch.fixes,
          [
            "Fixed not receiving the surfboard in the Beached Narwhal quest after delivering a Toxolotl.",
            "Fixed errors when changing the Squad order while they were being healed.",
            "The Tamer Info screen can now be closed even when there’s an error and it doesn’t display information.",
            "Fixed some interactions between moving platforms and opening eggs.",
            "Fixed Name Reservation missing icon.",
            "Fixed some dialogs."
          ],
        );
        expect(patch.improvements, []);
        expect(patch.features, []);
        expect(patch.balance, ["Increased the price for all breeding gears."]);
      });
    });
  });
}
