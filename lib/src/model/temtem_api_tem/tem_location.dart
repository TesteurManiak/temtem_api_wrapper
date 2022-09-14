part of 'temtem_api_tem.dart';

class TemLocation {
  final String location;
  final String place;
  final String note;
  final String island;
  final String frequency;
  final String level;
  final FreeTem freeTem;

  const TemLocation({
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

  @override
  bool operator ==(covariant TemLocation other) {
    if (identical(this, other)) return true;

    return other.location == location &&
        other.place == place &&
        other.note == note &&
        other.island == island &&
        other.frequency == frequency &&
        other.level == level &&
        other.freeTem == freeTem;
  }

  @override
  int get hashCode {
    return location.hashCode ^
        place.hashCode ^
        note.hashCode ^
        island.hashCode ^
        frequency.hashCode ^
        level.hashCode ^
        freeTem.hashCode;
  }
}
