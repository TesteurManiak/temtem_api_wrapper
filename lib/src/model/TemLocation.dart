class TemLocation {
  final String location;
  final String island;
  final String frequency;
  final String level;

  TemLocation({this.location, this.island, this.frequency, this.level});

  factory TemLocation.fromJson(Map<String, dynamic> json) {
    return TemLocation(
      location: json['location'],
      island: json['island'],
      frequency: json['frequency'],
      level: json['level'],
    );
  }
}
