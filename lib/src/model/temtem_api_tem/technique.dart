part of 'temtem_api_tem.dart';

class Technique {
  /// The name of the technique.
  final String name;

  /// This field is only filled if the technique has been expanded.
  final String? wikiUrl;

  /// This field is only filled if the technique has been expanded.
  final String? type;

  /// This field is only filled if the technique has been expanded.
  final String? classTouch;

  /// This field is only filled if the technique has been expanded.
  final String? classIcon;

  /// This field is only filled if the technique has been expanded.
  final int? damage;

  /// This field is only filled if the technique has been expanded.
  final int? staminaCost;

  /// This field is only filled if the technique has been expanded.
  final int? hold;

  /// This field is only filled if the technique has been expanded.
  final String? priority;

  /// This field is only filled if the technique has been expanded.
  final String? priorityIcon;

  /// This field is only filled if the technique has been expanded.
  final String? synergy;

  /// This field is only filled if the technique has been expanded.
  final List<SynergyEffect>? synergyEffects;

  /// This field is only filled if the technique has been expanded.
  final String? targets;

  /// This field is only filled if the technique has been expanded.
  final String? description;

  /// This field is only filled if the technique has been expanded.
  final String? effectText;

  /// This field is only filled if the technique has been expanded.
  final List<String>? effects;

  final String source;
  final int? levels;

  const Technique({
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
    required this.effectText,
    required this.effects,
    required this.source,
    required this.levels,
  });

  factory Technique.fromJson(Map<String, dynamic> json) {
    final synergyEffects = json['synergyEffects'] as Iterable?;
    return Technique(
      name: json['name'] as String,
      wikiUrl: json['wikiUrl'] as String?,
      type: json['type'] as String?,
      classTouch: json['classTouch'] as String?,
      classIcon: json['classIcon'] as String?,
      damage: json['damage'] as int?,
      staminaCost: json['staminaCost'] as int?,
      hold: json['hold'] as int?,
      priority: json['priority'] as String?,
      priorityIcon: json['priorityIcon'] as String?,
      synergy: json['synergy'] as String?,
      synergyEffects: synergyEffects?.map<SynergyEffect>((e) {
        if (e is String) {
          return SynergyEffect.fromString(e);
        } else {
          return SynergyEffect.fromJson(e as Map<String, dynamic>);
        }
      }).toList(),
      targets: json['targets'] as String?,
      description: json['description'] as String?,
      effectText: json['effectText'] as String?,
      effects: (json['effects'] as Iterable?)?.cast<String>().toList(),
      source: json['source'] as String,
      levels: json['levels'] as int?,
    );
  }

  String? get classIconUrl => classIcon != null
      ? HttpProvider.baseUri.replace(path: classIcon).toString()
      : null;

  String? get priorityIconUrl => priorityIcon != null
      ? HttpProvider.baseUri.replace(path: priorityIcon).toString()
      : null;

  @override
  bool operator ==(covariant Technique other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other.name == name &&
        other.wikiUrl == wikiUrl &&
        other.type == type &&
        other.classTouch == classTouch &&
        other.classIcon == classIcon &&
        other.damage == damage &&
        other.staminaCost == staminaCost &&
        other.hold == hold &&
        other.priority == priority &&
        other.priorityIcon == priorityIcon &&
        other.synergy == synergy &&
        listEquals(other.synergyEffects, synergyEffects) &&
        other.targets == targets &&
        other.description == description &&
        other.effectText == effectText &&
        listEquals(other.effects, effects) &&
        other.source == source &&
        other.levels == levels;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        wikiUrl.hashCode ^
        type.hashCode ^
        classTouch.hashCode ^
        classIcon.hashCode ^
        damage.hashCode ^
        staminaCost.hashCode ^
        hold.hashCode ^
        priority.hashCode ^
        priorityIcon.hashCode ^
        synergy.hashCode ^
        synergyEffects.hashCode ^
        targets.hashCode ^
        description.hashCode ^
        effectText.hashCode ^
        effects.hashCode ^
        source.hashCode ^
        levels.hashCode;
  }
}

class SynergyEffect {
  final String effect;
  final String? type;
  final int? damage;

  SynergyEffect({
    required this.effect,
    required this.type,
    required this.damage,
  });

  factory SynergyEffect.fromJson(Map<String, dynamic> json) => SynergyEffect(
        effect: json['effect'] as String,
        type: json['type'] as String?,
        damage: json['damage'] as int?,
      );

  factory SynergyEffect.fromString(String effect) {
    return SynergyEffect(
      effect: effect,
      type: null,
      damage: null,
    );
  }
}
