class Traits {
  final String name;
  final String wikiUrl;
  final String description;

  Traits({this.name, this.wikiUrl, this.description});

  factory Traits.fromJson(Map<String, dynamic> json) {
    return Traits(
      name: json['name'],
      wikiUrl: json['wikiUrl'],
      description: json['description'],
    );
  }
}
