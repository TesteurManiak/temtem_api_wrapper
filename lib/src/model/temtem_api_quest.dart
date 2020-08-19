class TemTemApiQuest {
  final String name;
  final String wikiUrl;
  final String type;
  final List<String> steps;
  final List<String> rewards;
  final String startingLocation;
  final String startingNPC;
  final String requirements;

  TemTemApiQuest({
    this.name,
    this.wikiUrl,
    this.type,
    this.steps,
    this.rewards,
    this.startingLocation,
    this.startingNPC,
    this.requirements,
  });

  factory TemTemApiQuest.fromJson(Map<String, dynamic> json) => TemTemApiQuest(
        name: json['name'],
        wikiUrl: json['wikiUrl'],
        type: json['type'],
        steps: List<String>.from(json['steps']),
        rewards: List<String>.from(json['rewards']),
        startingLocation: json['startingLocation'],
        startingNPC: json['startingNPC'],
        requirements: json['requirements'],
      );
}
