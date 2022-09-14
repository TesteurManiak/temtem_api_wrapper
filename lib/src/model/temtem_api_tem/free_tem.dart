part of 'temtem_api_tem.dart';

class FreeTem {
  final int minLevel;
  final int maxLevel;
  final int? minPansuns;
  final int? maxPansuns;

  const FreeTem({
    required this.minLevel,
    required this.maxLevel,
    required this.minPansuns,
    required this.maxPansuns,
  });

  factory FreeTem.fromJson(Map<String, dynamic> json) {
    return FreeTem(
      minLevel: json['minLevel'] as int,
      maxLevel: json['maxLevel'] as int,
      minPansuns: json['minPansuns'] as int?,
      maxPansuns: json['maxPansuns'] as int?,
    );
  }

  @override
  bool operator ==(covariant FreeTem other) {
    if (identical(this, other)) return true;

    return other.minLevel == minLevel &&
        other.maxLevel == maxLevel &&
        other.minPansuns == minPansuns &&
        other.maxPansuns == maxPansuns;
  }

  @override
  int get hashCode {
    return minLevel.hashCode ^
        maxLevel.hashCode ^
        minPansuns.hashCode ^
        maxPansuns.hashCode;
  }
}
