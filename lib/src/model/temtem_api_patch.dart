class TemTemApiPatch {
  final String name;
  final String version;
  final String url;
  final DateTime date;
  final List<String> fixes;
  final List<String> improvements;
  final List<String> features;
  final List<String> balance;

  TemTemApiPatch({
    required this.name,
    required this.version,
    required this.url,
    required this.date,
    required this.fixes,
    required this.improvements,
    required this.features,
    required this.balance,
  });

  factory TemTemApiPatch.fromJson(Map<String, dynamic> json) {
    final patchJson = json['patchInfo'] as Map<String, dynamic>;
    final date = (json['date'] as String).split('-').map(int.parse).toList();
    return TemTemApiPatch(
      name: json['name'] as String,
      version: json['version'] as String,
      url: json['url'] as String,
      date: DateTime(date[0], date[1], date[2]),
      fixes: List<String>.from(patchJson['fixes'] as Iterable),
      improvements: List<String>.from(patchJson['improvements'] as Iterable),
      features: List<String>.from(patchJson['features'] as Iterable),
      balance: List<String>.from(patchJson['balance'] as Iterable),
    );
  }
}
