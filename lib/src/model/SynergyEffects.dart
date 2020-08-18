import 'package:temtem_api_wrapper/src/json_helper.dart';

class SynergyEffects {
  final String effect;
  final String type;
  final int damage;

  SynergyEffects({this.effect, this.type, this.damage});

  factory SynergyEffects.fromJson(Map<String, dynamic> json) {
    return SynergyEffects(
      effect: json[JsonHelper.effect],
      type: json[JsonHelper.type],
      damage: json[JsonHelper.damage],
    );
  }
}
