/// Model for characters.
class TemTemApiCharacter {
  /// Character's name.
  final String name;

  /// Character's url on the wiki.
  final String wikiUrl;

  TemTemApiCharacter({required this.name, required this.wikiUrl});

  factory TemTemApiCharacter.fromJson(Map<String, dynamic> json) {
    return TemTemApiCharacter(
      name: json['name'] as String,
      wikiUrl: json['wikiUrl'] as String,
    );
  }
}
