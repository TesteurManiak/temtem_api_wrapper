/// Model for characters.
class TemTemApiCharacter {
  /// Character's name.
  final String name;

  /// Character's url on the wiki.
  final String wikiUrl;

  TemTemApiCharacter({this.name, this.wikiUrl});

  factory TemTemApiCharacter.fromJson(Map<String, dynamic> json) =>
      TemTemApiCharacter(name: json['name'], wikiUrl: json['wikiUrl']);
}
