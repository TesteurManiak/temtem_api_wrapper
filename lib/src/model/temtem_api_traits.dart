class TemTemApiTraits {
  final String name;
  final String wikiUrl;
  final String description;

  TemTemApiTraits({this.name, this.wikiUrl, this.description});

  factory TemTemApiTraits.fromJson(Map<String, dynamic> json) {
    return TemTemApiTraits(
      name: json['name'],
      wikiUrl: json['wikiUrl'],
      description: json['description'],
    );
  }
}
