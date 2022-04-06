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
      name: json['name'],
      wikiUrl: json['wikiUrl'],
      wikiIconUrl: json['wikiIconUrl'],
      icon: json['icon'],
      category: json['category'],
      consumable: json['consumable'],
      limitedQuantity: json['limitedQuantity'],
      purchasable: json['purchasable'],
      buyPrice: json['buyPrice'],
      description: json['description'],
      gameDescription: json['gameDescription'],
    );
  }
}
