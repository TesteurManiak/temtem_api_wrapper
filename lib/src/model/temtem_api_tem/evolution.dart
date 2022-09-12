part of 'temtem_api_tem.dart';

class Evolution {
  final int? stage;
  final List<EvolutionNode>? evolutionTree;
  final bool evolves;
  final String? type;
  final String? description;

  Evolution({
    required this.stage,
    required this.evolutionTree,
    required this.evolves,
    required this.type,
    this.description,
  });

  factory Evolution.fromJson(Map<String, dynamic> json) {
    return Evolution(
      stage: json['stage'] as int?,
      evolutionTree: (json['evolutionTree'] as Iterable?)
          ?.cast<Map<String, dynamic>>()
          .map(EvolutionNode.fromJson)
          .toList(),
      evolves: json['evolves'] as bool,
      type: json['type'] as String?,
      description: json['description'] as String?,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Evolution &&
        other.stage == stage &&
        const ListEquality().equals(other.evolutionTree, evolutionTree) &&
        other.evolves == evolves &&
        other.type == type &&
        other.description == description;
  }

  @override
  int get hashCode {
    return stage.hashCode ^
        const ListEquality().hash(evolutionTree) ^
        evolves.hashCode ^
        type.hashCode ^
        description.hashCode;
  }
}
