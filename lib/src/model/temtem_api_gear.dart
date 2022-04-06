class TemTemApiGear {
  final String name;
  final String wikiUrl;
  final String wikiIconUrl;
  final String icon;
  final String category;
  final bool consumable;
  final bool limitedQuantity;
  final bool purchasable;
  final int buyPrice;
  final String description;
  final String gameDescription;

  TemTemApiGear({
    required this.name,
    required this.wikiUrl,
    required this.wikiIconUrl,
    required this.icon,
    required this.category,
    required this.consumable,
    required this.limitedQuantity,
    required this.purchasable,
    required this.buyPrice,
    required this.description,
    required this.gameDescription,
  });

  factory TemTemApiGear.fromJson(Map<String, dynamic> json) {
    return TemTemApiGear(
      name: json['name'] as String,
      wikiUrl: json['wikiUrl'] as String,
      wikiIconUrl: json['wikiIconUrl'] as String,
      icon: json['icon'] as String,
      category: json['category'] as String,
      consumable: json['consumable'] as bool,
      limitedQuantity: json['limitedQuantity'] as bool,
      purchasable: json['purchasable'] as bool,
      buyPrice: json['buyPrice'] as int,
      description: json['description'] as String,
      gameDescription: json['gameDescription'] as String,
    );
  }
}
