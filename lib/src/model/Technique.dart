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
      name: json['name'],
      wikiUrl: json['wikiUrl'],
      type: json['type'],
      classTouch: json['classTouch'],
      damage: json['damage'],
      staminaCost: json['staminaCost'],
      hold: json['hold'],
      priority: json['priority'],
      synergy: json['synergy'],
      synergyEffects: (json['synergyEffects'] as List)
          .map((item) => SynergyEffects.fromJson(item))
          .toList(),
      targets: json['targets'].toString(),
      description: json['description'].toString().replaceAll('\n', ''),
    );
  }
}
