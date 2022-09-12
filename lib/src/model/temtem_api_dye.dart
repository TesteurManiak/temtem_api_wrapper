class TemTemApiDye {
  final String wikiImageUrl;

  /// Dye's color in Hex format.
  final String color;

  final String name;
  final String description;
  final List<String> bundles;

  TemTemApiDye({
    required this.wikiImageUrl,
    required this.color,
    required this.name,
    required this.description,
    required this.bundles,
  });

  factory TemTemApiDye.fromJson(Map<String, dynamic> json) {
    return TemTemApiDye(
      wikiImageUrl: json['wikiImageUrl'] as String,
      color: json['color'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      bundles: List<String>.from(json['bundles'] as Iterable),
    );
  }
}
