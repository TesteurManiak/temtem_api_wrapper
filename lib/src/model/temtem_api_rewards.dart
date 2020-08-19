class TemTemApiRewards {
  final String name;
  final int quantity;
  final String wikiUrl;
  final String wikiImageUrl;
  final String effectDescription;
  final String requirement;
  final int freedTemtem;
  final String duration;
  final String startDate;
  final String endDate;

  TemTemApiRewards({
    this.name,
    this.quantity,
    this.wikiUrl,
    this.wikiImageUrl,
    this.effectDescription,
    this.requirement,
    this.freedTemtem,
    this.duration,
    this.startDate,
    this.endDate,
  });

  factory TemTemApiRewards.fromJson(Map<String, dynamic> json) =>
      TemTemApiRewards(
        name: json['name'],
        quantity: json['quantity'],
        wikiUrl: json['wikiUrl'],
        wikiImageUrl: json['wikiImageUrl'],
        effectDescription: json['effectDescription'],
        requirement: json['requirement'],
        freedTemtem: json['freedTemtem'],
        duration: json['duration'],
        startDate: json['startDate'],
        endDate: json['endDate'],
      );
}
