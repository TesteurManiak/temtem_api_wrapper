class TemType {
  final String name;
  final String icon;

  TemType({this.name, this.icon});

  factory TemType.fromJson(Map<String, dynamic> json) =>
      TemType(name: json['name'], icon: json['icon']);
}
