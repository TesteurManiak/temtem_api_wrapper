import 'package:temtem_api_wrapper/src/JsonHelper.dart';
import 'package:temtem_api_wrapper/src/model/SynergyEffects.dart';

class Technique {
  final String name;
  final String wikiUrl;
  final String type;
  final String classTouch;
  final int damage;
  final int staminaCost;
  final int hold;
  final String priority;
  final String synergy;
  final List<SynergyEffects> synergyEffects;
  final String targets;
  final String description;

  Technique({
    this.name,
    this.wikiUrl,
    this.type,
    this.classTouch,
    this.damage,
    this.staminaCost,
    this.hold,
    this.priority,
    this.synergy,
    this.synergyEffects,
    this.targets,
    this.description,
  });

  factory Technique.fromJson(Map<String, dynamic> json) {
    return Technique(
      name: json[JsonHelper.name],
      wikiUrl: json[JsonHelper.wikiUrl],
      type: json[JsonHelper.type],
      classTouch: json[JsonHelper.classTouch],
      damage: json[JsonHelper.damage],
      staminaCost: json[JsonHelper.staminaCost],
      hold: json[JsonHelper.hold],
      priority: json[JsonHelper.priority],
      synergy: json[JsonHelper.synergy],
      synergyEffects: (json[JsonHelper.synergyEffects] as List)
          .map((item) => SynergyEffects.fromJson(item))
          .toList(),
      targets: json[JsonHelper.targets].toString(),
      description: json[JsonHelper.description].toString().replaceAll('\n', ''),
    );
  }
}
