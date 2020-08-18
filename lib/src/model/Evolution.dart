import 'package:temtem_api_wrapper/src/json_helper.dart';

class EvolutionNode {
  final int number;
  final String name;
  final int stage;
  final dynamic levels;
  final bool trading;
  final Map<String, dynamic> traitMapping;

  EvolutionNode({
    this.number,
    this.name,
    this.stage,
    this.levels,
    this.trading,
    this.traitMapping,
  });

  factory EvolutionNode.fromJson(Map<String, dynamic> json) {
    return EvolutionNode(
      number: json[JsonHelper.number],
      name: json[JsonHelper.name],
      stage: json[JsonHelper.stage],
      levels: json[JsonHelper.levels],
      trading: json[JsonHelper.trading],
      traitMapping: json[JsonHelper.traitMapping],
    );
  }
}

class Evolution {
  final int stage;
  final List<EvolutionNode> evolutionTree;
  final bool evolves;
  final String type;
  final String description;

  Evolution(
      {this.stage,
      this.evolutionTree,
      this.evolves,
      this.type,
      this.description});

  factory Evolution.fromJson(Map<String, dynamic> json) {
    List<EvolutionNode> _evolutionTree = [];
    if (json[JsonHelper.evolutionTree] != null) {
      json[JsonHelper.evolutionTree]
          .forEach((node) => _evolutionTree.add(EvolutionNode.fromJson(node)));
    }
    return Evolution(
      stage: json[JsonHelper.stage],
      evolutionTree: _evolutionTree,
      evolves: json[JsonHelper.evolves],
      type: json[JsonHelper.type],
      description: json[JsonHelper.description],
    );
  }
}
