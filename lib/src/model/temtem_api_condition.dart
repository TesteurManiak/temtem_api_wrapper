class TemTemApiCondition {
  final String name;
  final String description;
  final String icon;

  TemTemApiCondition({this.name, this.description, this.icon});

  factory TemTemApiCondition.fromJson(Map<String, dynamic> json) =>
      TemTemApiCondition(
        name: json['name'],
        description: json['description'],
        icon: json['icon'],
      );
}
