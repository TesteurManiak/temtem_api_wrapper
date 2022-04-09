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
  final List<String>? synergyEffects;

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

  Technique({
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

  factory Technique.fromJson(Map<String, dynamic> json) => Technique(
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
        synergyEffects:
            (json['synergyEffects'] as Iterable?)?.cast<String>().toList(),
        targets: json['targets'] as String?,
        description: json['description'] as String?,
        effectText: json['effectText'] as String?,
        effects: (json['effects'] as Iterable?)?.cast<String>().toList(),
        source: json['source'] as String,
        levels: json['levels'] as int?,
      );

  String? get classIconUrl => classIcon != null
      ? HttpProvider.baseUri.replace(path: classIcon).toString()
      : null;

  String? get priorityIconUrl => priorityIcon != null
      ? HttpProvider.baseUri.replace(path: priorityIcon).toString()
      : null;
}
