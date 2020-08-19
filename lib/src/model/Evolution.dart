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
      number: json['number'],
      name: json['name'],
      stage: json['stage'],
      levels: json['levels'],
      trading: json['trading'],
      traitMapping: json['traitMapping'],
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
    if (json['evolutionTree'] != null) {
      json['evolutionTree']
          .forEach((node) => _evolutionTree.add(EvolutionNode.fromJson(node)));
    }
    return Evolution(
      stage: json['stage'],
      evolutionTree: _evolutionTree,
      evolves: json['evolves'],
      type: json['type'],
      description: json['description'],
    );
  }
}
