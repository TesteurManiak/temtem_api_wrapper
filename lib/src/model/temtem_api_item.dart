class TemTemApiItem {
  final String wikiImageUrl;
  final String name;
  final String wikiUrl;
  final String? description;
  final String? effect;
  final String? location;
  final int? buyPrice;
  final int? sellPrice;
  final String? quest;
  final String category;

  TemTemApiItem({
    required this.wikiImageUrl,
    required this.name,
    required this.wikiUrl,
    required this.description,
    required this.effect,
    required this.location,
    required this.buyPrice,
    required this.sellPrice,
    required this.quest,
    required this.category,
  });

  factory TemTemApiItem.fromJson(Map<String, dynamic> json) => TemTemApiItem(
        wikiImageUrl: json['wikiImageUrl'] as String,
        name: json['name'] as String,
        wikiUrl: json['wikiUrl'] as String,
        description: json['description'] as String?,
        effect: json['effect'] as String?,
        location: json['location'] as String?,
        buyPrice: json['buyPrice'] as int?,
        sellPrice: json['sellPrice'] as int?,
        quest: json['quest'] as String?,
        category: json['category'] as String,
      );
}
