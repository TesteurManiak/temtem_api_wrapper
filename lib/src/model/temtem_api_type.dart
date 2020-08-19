class TemTemApiType {
  final String name;
  final String icon;

  TemTemApiType({this.name, this.icon});

  String get iconUrl => 'https://temtem-api.mael.tech$icon';

  factory TemTemApiType.fromJson(Map<String, dynamic> json) =>
      TemTemApiType(name: json['name'], icon: json['icon']);
}
