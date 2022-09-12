class TemTemApiCosmetic {
  final String type;
  final String wikiImageUrl;
  final String wikiUrl;
  final String name;
  final String location;
  final int cost;
  final String requirement;
  final String description;

  TemTemApiCosmetic({
    required this.type,
    required this.wikiImageUrl,
    required this.wikiUrl,
    required this.name,
    required this.location,
    required this.cost,
    required this.requirement,
    required this.description,
  });

  factory TemTemApiCosmetic.fromJson(Map<String, dynamic> json) =>
      TemTemApiCosmetic(
        type: json['type'] as String,
        wikiImageUrl: json['wikiImageUrl'] as String,
        wikiUrl: json['wikiUrl'] as String,
        name: json['name'] as String,
        location: json['location'] as String,
        cost: json['cost'] as int,
        requirement: json['requirement'] as String,
        description: json['description'] as String,
      );
}
