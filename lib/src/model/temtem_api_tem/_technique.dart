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
        name: json['name'],
        source: json['source'],
        levels: json['levels'] as int?,
      );
}
