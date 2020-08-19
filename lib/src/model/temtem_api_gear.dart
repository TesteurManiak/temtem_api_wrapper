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
    this.name,
    this.wikiUrl,
    this.wikiIconUrl,
    this.icon,
    this.category,
    this.consumable,
    this.limitedQuantity,
    this.purchasable,
    this.buyPrice,
    this.description,
    this.gameDescription,
  });

  factory TemTemApiGear.fromJson(Map<String, dynamic> json) => TemTemApiGear(
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
