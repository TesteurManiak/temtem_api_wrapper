class TemTemApiPatch {
  final String name;
  final String version;
  final String url;
  final String date;
  final List<String> fixes;
  final List<String> improvements;
  final List<String> features;

  TemTemApiPatch({
    required this.name,
    required this.version,
    required this.url,
    required this.date,
    required this.fixes,
    required this.improvements,
    required this.features,
  });

  factory TemTemApiPatch.fromJson(Map<String, dynamic> json) {
    final patchJson = json['patchInfo'] as Map<String, dynamic>;
    return TemTemApiPatch(
      name: json['name'],
      version: json['version'],
      url: json['url'],
      date: json['date'],
      fixes: List<String>.from(patchJson['fixes'] as Iterable),
      improvements: List<String>.from(patchJson['improvements'] as Iterable),
      features: List<String>.from(patchJson['features'] as Iterable),
    );
  }
}
