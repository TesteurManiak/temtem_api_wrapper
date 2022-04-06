part of 'temtem_api_tem.dart';

class Technique {
  final String name;
  final String source;
  final int? levels;

  Technique({
    required this.name,
    required this.source,
    this.levels,
  });

  factory Technique.fromJson(Map<String, dynamic> json) => Technique(
        name: json['name'] as String,
        source: json['source'] as String,
        levels: json['levels'] as int?,
      );
}
