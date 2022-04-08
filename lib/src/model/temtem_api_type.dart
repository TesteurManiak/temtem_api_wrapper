import 'package:temtem_api_wrapper/src/utils/consts.dart';

class TemTemApiType {
  /// Type's name.
  final String name;

  /// The icon field is the path to an image under https://temtem-api.mael.tech.
  final String icon;

  TemTemApiType({
    required this.name,
    required this.icon,
  });

  String get iconUrl => '${TemTemApiConstants.imgHost}$icon';

  factory TemTemApiType.fromJson(Map<String, dynamic> json) {
    return TemTemApiType(
      name: json['name'] as String,
      icon: json['icon'] as String,
    );
  }
}
