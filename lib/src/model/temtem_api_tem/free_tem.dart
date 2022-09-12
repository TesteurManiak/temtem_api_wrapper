part of 'temtem_api_tem.dart';

class FreeTem {
  final int minLevel;
  final int maxLevel;
  final int? minPansuns;
  final int? maxPansuns;

  FreeTem({
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
}
