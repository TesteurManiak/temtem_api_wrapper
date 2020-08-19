class TemTemApiCharacter {
  final String name;
  final String wikiUrl;

  TemTemApiCharacter({this.name, this.wikiUrl});

  factory TemTemApiCharacter.fromJson(Map<String, dynamic> json) =>
      TemTemApiCharacter(name: json['name'], wikiUrl: json['wikiUrl']);
}
