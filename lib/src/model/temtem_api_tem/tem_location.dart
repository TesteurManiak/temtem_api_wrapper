part of 'temtem_api_tem.dart';

class TemLocation {
  final String location;
  final String place;
  final String note;
  final String island;
  final String frequency;
  final String level;
  final FreeTem freeTem;

  TemLocation({
    required this.location,
    required this.place,
    required this.note,
    required this.island,
    required this.frequency,
    required this.level,
    required this.freeTem,
  });

  factory TemLocation.fromJson(Map<String, dynamic> json) {
    return TemLocation(
      location: json['location'] as String,
      place: json['place'] as String,
      note: json['note'] as String,
      island: json['island'] as String,
      frequency: json['frequency'] as String,
      level: json['level'] as String,
      freeTem: FreeTem.fromJson(json['freetem'] as Map<String, dynamic>),
    );
  }
}
