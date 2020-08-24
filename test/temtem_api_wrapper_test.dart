import 'package:flutter_test/flutter_test.dart';
import 'package:temtem_api_wrapper/src/model/temtem_api_tem.dart';
import 'test_json.dart';

void main() {
  test('TemTemApiTem List<dynamic> is not subtype of int', () {
    final TemTemApiTem temtem = TemTemApiTem.fromJson(oreeJSON);
    expect(temtem, isNotNull);
  });
}
