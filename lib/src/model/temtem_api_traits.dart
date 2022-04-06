class TemTemApiTraits {
  final String name;
  final String wikiUrl;
  final String description;

  TemTemApiTraits({
    required this.name,
    required this.wikiUrl,
    required this.description,
  });

  factory TemTemApiTraits.fromJson(Map<String, dynamic> json) {
    return TemTemApiTraits(
      name: json['name'] as String,
      wikiUrl: json['wikiUrl'] as String,
      description: json['description'] as String,
    );
  }
}
