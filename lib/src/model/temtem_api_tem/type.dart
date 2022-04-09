part of 'temtem_api_tem.dart';

class Type {
  final String name;
  final String? icon;

  Type({required this.name, required this.icon});

  factory Type.fromJson(Map<String, dynamic> json) {
    return Type(
      name: json['name'] as String,
      icon: json['icon'] as String?,
    );
  }

  factory Type.fromString(String type) {
    return Type(name: type, icon: null);
  }

  String? get iconUrl =>
      icon != null ? HttpProvider.baseUri.replace(path: icon).toString() : null;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Type && other.name == name && other.icon == icon;
  }

  @override
  int get hashCode => name.hashCode ^ icon.hashCode;
}
