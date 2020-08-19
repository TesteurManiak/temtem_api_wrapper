import 'package:temtem_api_wrapper/src/model/SynergyEffects.dart';

class TemTemApiTechnique {
  final String name;
  final String wikiUrl;
  final String type;
  final String classTouch;
  final String classIcon;
  final int damage;
  final int staminaCost;
  final int hold;
  final String priority;
  final String priorityIcon;
  final String synergy;
  final List<SynergyEffects> synergyEffects;
  final String targets;
  final String description;

  TemTemApiTechnique({
    this.name,
    this.wikiUrl,
    this.type,
    this.classTouch,
    this.classIcon,
    this.damage,
    this.staminaCost,
    this.hold,
    this.priority,
    this.priorityIcon,
    this.synergy,
    this.synergyEffects,
    this.targets,
    this.description,
  });

  factory TemTemApiTechnique.fromJson(Map<String, dynamic> json) {
    return TemTemApiTechnique(
      name: json['name'],
      wikiUrl: json['wikiUrl'],
      type: json['type'],
      classTouch: json['class'],
      classIcon: json['classIcon'],
      damage: json['damage'],
      staminaCost: json['staminaCost'],
      hold: json['hold'],
      priority: json['priority'],
      priorityIcon: json['priorityIcon'],
      synergy: json['synergy'],
      synergyEffects: (json['synergyEffects'] as List)
          .map<SynergyEffects>((item) => SynergyEffects.fromJson(item))
          .toList(),
      targets: json['targets'].toString(),
      description: json['description'].toString().replaceAll('\n', ''),
    );
  }
}
