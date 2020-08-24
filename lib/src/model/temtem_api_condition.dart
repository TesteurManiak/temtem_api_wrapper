/// Model for conditions.
class TemTemApiCondition {
  /// Condition's name.
  final String name;

  /// Condition's description.
  final String description;

  /// The icon field is the path to an image under https://temtem-api.mael.tech.
  final String icon;

  TemTemApiCondition({this.name, this.description, this.icon});

  factory TemTemApiCondition.fromJson(Map<String, dynamic> json) =>
      TemTemApiCondition(
        name: json['name'],
        description: json['description'],
        icon: json['icon'],
      );
}
