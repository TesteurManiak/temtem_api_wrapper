import 'package:temtem_api_wrapper/src/JsonHelper.dart';

class TemLocation {
  final String location;
  final String island;
  final String frequency;
  final String level;

  TemLocation({this.location, this.island, this.frequency, this.level});

  factory TemLocation.fromJson(Map<String, dynamic> json) {
    return TemLocation(
      location: json[JsonHelper.location],
      island: json[JsonHelper.island],
      frequency: json[JsonHelper.frequency],
      level: json[JsonHelper.level],
    );
  }
}
