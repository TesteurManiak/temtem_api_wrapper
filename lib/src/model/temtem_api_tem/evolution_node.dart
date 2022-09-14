part of 'temtem_api_tem.dart';

class EvolutionNode {
  final int number;
  final String name;
  final int stage;
  final num? levels;
  final bool? trading;
  final Map<String, dynamic> traitMapping;

  const EvolutionNode({
    required this.number,
    required this.name,
    required this.stage,
    this.levels,
    this.trading,
    required this.traitMapping,
  });

  factory EvolutionNode.fromJson(Map<String, dynamic> json) => EvolutionNode(
        number: json['number'] as int,
        name: json['name'] as String,
        stage: json['stage'] as int,
        levels: json['levels'] as num?,
        trading: json['trading'] as bool?,
        traitMapping: json['traitMapping'] as Map<String, dynamic>,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is EvolutionNode &&
        other.number == number &&
        other.name == name &&
        other.stage == stage &&
        other.levels == levels &&
        other.trading == trading &&
        const MapEquality().equals(other.traitMapping, traitMapping);
  }

  @override
  int get hashCode {
    return number.hashCode ^
        name.hashCode ^
        stage.hashCode ^
        levels.hashCode ^
        trading.hashCode ^
        const MapEquality().hash(traitMapping);
  }
}
