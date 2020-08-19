class TemTemApiItem {
  final String wikiImageUrl;
  final String name;
  final String wikiUrl;
  final String description;
  final String effect;
  final String location;
  final int buyPrice;
  final int sellPrice;
  final String quest;
  final String category;

  TemTemApiItem({
    this.wikiImageUrl,
    this.name,
    this.wikiUrl,
    this.description,
    this.effect,
    this.location,
    this.buyPrice,
    this.sellPrice,
    this.quest,
    this.category,
  });

  factory TemTemApiItem.fromJson(Map<String, dynamic> json) => TemTemApiItem(
        wikiImageUrl: json['wikiImageUrl'],
        name: json['name'],
        wikiUrl: json['wikiUrl'],
        description: json['description'],
        effect: json['effect'],
        location: json['location'],
        buyPrice: json['buyPrice'],
        sellPrice: json['sellPrice'],
        quest: json['quest'],
        category: json['category'],
      );
}
