import 'package:temtem_api_wrapper/src/json_helper.dart';

class GenderRatio {
  final double male;
  final double female;

  GenderRatio({this.male, this.female});

  factory GenderRatio.fromJson(Map<String, dynamic> json) => GenderRatio(
      male: double.parse(json[JsonHelper.male].toString()),
      female: double.parse(json[JsonHelper.female].toString()));
}
