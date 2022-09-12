import 'package:temtem_api_wrapper/src/provider/http_provider.dart';

class TemTemApiType {
  /// Type's name.
  final String name;

  /// The icon field is the path to an image under https://temtem-api.mael.tech.
  final String icon;

  TemTemApiType({
    required this.name,
    required this.icon,
  });

  String get iconUrl => '${HttpProvider.baseUrl}$icon';

  factory TemTemApiType.fromJson(Map<String, dynamic> json) {
    return TemTemApiType(
      name: json['name'] as String,
      icon: json['icon'] as String,
    );
  }
}
