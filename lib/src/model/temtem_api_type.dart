class TemTemApiType {
  final String name;
  final String icon;

  TemTemApiType({this.name, this.icon});

  factory TemTemApiType.fromJson(Map<String, dynamic> json) =>
      TemTemApiType(name: json['name'], icon: json['icon']);
}
