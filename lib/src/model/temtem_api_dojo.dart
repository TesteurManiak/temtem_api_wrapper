class TemTemApiDojo {
  final String name;
  final String wikiUrl;
  final List<String> types;
  final String leaderName;
  final List<LeaderTemtem> leaderTemtems;

  TemTemApiDojo({
    required this.name,
    required this.wikiUrl,
    required this.types,
    required this.leaderName,
    required this.leaderTemtems,
  });

  factory TemTemApiDojo.fromJson(Map<String, dynamic> json) {
    final leaderJson = json['leader'] as Map<String, dynamic>;
    return TemTemApiDojo(
      name: json['name'] as String,
      wikiUrl: json['wikiUrl'] as String,
      types: List<String>.from(json['types'] as Iterable),
      leaderName: leaderJson['name'] as String,
      leaderTemtems: (leaderJson['temtem'] as Iterable)
          .cast<Map<String, dynamic>>()
          .map(LeaderTemtem.fromJson)
          .toList(),
    );
  }
}

class LeaderTemtem {
  final int level;
  final String name;
  final int number;
  final String trait;
  final List<String> techniques;

  LeaderTemtem({
    required this.level,
    required this.name,
    required this.number,
    required this.trait,
    required this.techniques,
  });

  factory LeaderTemtem.fromJson(Map<String, dynamic> json) {
    return LeaderTemtem(
      level: json['level'] as int,
      name: json['name'] as String,
      number: json['number'] as int,
      trait: json['trait'] as String,
      techniques: List<String>.from(json['techniques'] as Iterable),
    );
  }
}
