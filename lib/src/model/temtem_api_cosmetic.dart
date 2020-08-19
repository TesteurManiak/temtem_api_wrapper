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
    this.type,
    this.wikiImageUrl,
    this.wikiUrl,
    this.name,
    this.location,
    this.cost,
    this.requirement,
    this.description,
  });

  factory TemTemApiCosmetic.fromJson(Map<String, dynamic> json) =>
      TemTemApiCosmetic(
        type: json['type'],
        wikiImageUrl: json['wikiImageUrl'],
        wikiUrl: json['wikiUrl'],
        name: json['name'],
        location: json['location'],
        cost: json['cost'],
        requirement: json['requirement'],
        description: json['description'],
      );
}
