part of 'temtem_api_tem.dart';

class Trait {
  final String name;

  /// This field is only filled if the technique has been expanded.
  final String? wikiUrl;

  /// This field is only filled if the technique has been expanded.
  final String? description;

  /// This field is only filled if the technique has been expanded.
  final String? effect;

  Trait({
    required this.name,
    required this.wikiUrl,
    required this.description,
    required this.effect,
  });

  factory Trait.fromString(String trait) {
    return Trait(name: trait, wikiUrl: null, description: null, effect: null);
  }

  factory Trait.fromJson(Map<String, dynamic> json) => Trait(
        name: json['name'] as String,
        wikiUrl: json['wikiUrl'] as String?,
        description: json['description'] as String?,
        effect: json['effect'] as String?,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Trait &&
        other.name == name &&
        other.wikiUrl == wikiUrl &&
        other.description == description &&
        other.effect == effect;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        wikiUrl.hashCode ^
        description.hashCode ^
        effect.hashCode;
  }
}
