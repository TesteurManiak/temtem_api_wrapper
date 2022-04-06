/// Model for conditions.
class TemTemApiCondition {
  /// Condition's name.
  final String name;

  /// Condition's description.
  final String description;

  /// The icon field is the path to an image under https://temtem-api.mael.tech.
  final String icon;

  TemTemApiCondition({
    required this.name,
    required this.description,
    required this.icon,
  });

  factory TemTemApiCondition.fromJson(Map<String, dynamic> json) =>
      TemTemApiCondition(
        name: json['name'] as String,
        description: json['description'] as String,
        icon: json['icon'] as String,
      );
}
