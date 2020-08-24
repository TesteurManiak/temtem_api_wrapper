class _SynergyEffect {
  final String effect;
  final String type;
  final int damage;

  _SynergyEffect({this.effect, this.type, this.damage});

  factory _SynergyEffect.fromJson(Map<String, dynamic> json) => _SynergyEffect(
        effect: json['effect'],
        type: json['type'],
        damage: json['damage'],
      );
}

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
  final List<_SynergyEffect> synergyEffects;
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
          .map<_SynergyEffect>((item) => _SynergyEffect.fromJson(item))
          .toList(),
      targets: json['targets'].toString(),
      description: json['description'].toString().replaceAll('\n', ''),
    );
  }
}
