import 'package:temtem_api_wrapper/src/provider/http_provider.dart';

class SynergyEffect {
  final String effect;
  final String type;
  final int damage;

  SynergyEffect({
    required this.effect,
    required this.type,
    required this.damage,
  });

  factory SynergyEffect.fromJson(Map<String, dynamic> json) => SynergyEffect(
        effect: json['effect'] as String,
        type: json['type'] as String,
        damage: json['damage'] as int,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SynergyEffect &&
        other.effect == effect &&
        other.type == type &&
        other.damage == damage;
  }

  @override
  int get hashCode => effect.hashCode ^ type.hashCode ^ damage.hashCode;
}

class TemTemApiTechnique {
  final String name;
  final String wikiUrl;
  final String type;
  final String classTouch;

  /// The icon field is the path to an image under https://temtem-api.mael.tech.
  final String classIcon;

  final int damage;
  final int staminaCost;
  final int hold;
  final String priority;
  final String priorityIcon;
  final String synergy;
  final List<SynergyEffect> synergyEffects;
  final String targets;
  final String description;

  TemTemApiTechnique({
    required this.name,
    required this.wikiUrl,
    required this.type,
    required this.classTouch,
    required this.classIcon,
    required this.damage,
    required this.staminaCost,
    required this.hold,
    required this.priority,
    required this.priorityIcon,
    required this.synergy,
    required this.synergyEffects,
    required this.targets,
    required this.description,
  });

  String get classIconUrl => '${HttpProvider.baseUrl}$classIcon';
  String get priorityIconUrl => '${HttpProvider.baseUrl}$priorityIcon';

  factory TemTemApiTechnique.fromJson(Map<String, dynamic> json) {
    return TemTemApiTechnique(
      name: json['name'] as String,
      wikiUrl: json['wikiUrl'] as String,
      type: json['type'] as String,
      classTouch: json['class'] as String,
      classIcon: json['classIcon'] as String,
      damage: json['damage'] as int,
      staminaCost: json['staminaCost'] as int,
      hold: json['hold'] as int,
      priority: json['priority'] as String,
      priorityIcon: json['priorityIcon'] as String,
      synergy: json['synergy'] as String,
      synergyEffects: (json['synergyEffects'] as Iterable)
          .cast<Map<String, dynamic>>()
          .map<SynergyEffect>(SynergyEffect.fromJson)
          .toList(),
      targets: json['targets'].toString(),
      description: json['description'].toString().replaceAll('\n', ''),
    );
  }
}
