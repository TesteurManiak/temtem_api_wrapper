class TemTemApiRewards {
  final String name;
  final int quantity;
  final String wikiUrl;
  final String wikiImageUrl;
  final String effectDescription;
  final String requirement;
  final int freedTemtem;
  final String duration;
  final DateTime startDate;
  final DateTime endDate;

  TemTemApiRewards({
    required this.name,
    required this.quantity,
    required this.wikiUrl,
    required this.wikiImageUrl,
    required this.effectDescription,
    required this.requirement,
    required this.freedTemtem,
    required this.duration,
    required this.startDate,
    required this.endDate,
  });

  factory TemTemApiRewards.fromJson(Map<String, dynamic> json) =>
      TemTemApiRewards(
        name: json['name'] as String,
        quantity: json['quantity'] as int,
        wikiUrl: json['wikiUrl'] as String,
        wikiImageUrl: json['wikiImageUrl'] as String,
        effectDescription: json['effectDescription'] as String,
        requirement: json['requirement'] as String,
        freedTemtem: json['freedTemtem'] as int,
        duration: json['duration'] as String,
        startDate: DateTime.parse(json['startDate'] as String),
        endDate: DateTime.parse(json['endDate'] as String),
      );
}
