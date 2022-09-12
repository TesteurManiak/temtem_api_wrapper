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
    required this.name,
    required this.wikiUrl,
    required this.type,
    required this.steps,
    required this.rewards,
    required this.startingLocation,
    required this.startingNPC,
    required this.requirements,
  });

  factory TemTemApiQuest.fromJson(Map<String, dynamic> json) => TemTemApiQuest(
        name: json['name'] as String,
        wikiUrl: json['wikiUrl'] as String,
        type: json['type'] as String,
        steps: List<String>.from(json['steps'] as Iterable),
        rewards: List<String>.from(json['rewards'] as Iterable),
        startingLocation: json['startingLocation'] as String,
        startingNPC: json['startingNPC'] as String,
        requirements: json['requirements'] as String,
      );
}
