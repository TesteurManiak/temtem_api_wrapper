import 'package:temtem_api_wrapper/src/JsonHelper.dart';

class Traits {
  final String name;
  final String wikiUrl;
  final String description;

  Traits({this.name, this.wikiUrl, this.description});

  factory Traits.fromJson(Map<String, dynamic> json) {
    return Traits(
      name: json[JsonHelper.name],
      wikiUrl: json[JsonHelper.wikiUrl],
      description: json[JsonHelper.description],
    );
  }
}
