class _PatchInfo {
  final List<String> fixes;
  final List<String> improvements;
  final List<String> features;

  _PatchInfo({this.fixes, this.improvements, this.features});

  factory _PatchInfo.fromJson(Map<String, dynamic> json) => _PatchInfo(
        fixes: List<String>.from(json['fixes']),
        improvements: List<String>.from(json['improvements']),
        features: List<String>.from(json['features']),
      );
}

class TemTemApiPatch {
  final String name;
  final String version;
  final String url;
  final String date;
  final _PatchInfo patchInfo;

  TemTemApiPatch({
    this.name,
    this.version,
    this.url,
    this.date,
    this.patchInfo,
  });

  factory TemTemApiPatch.fromJson(Map<String, dynamic> json) => TemTemApiPatch(
        name: json['name'],
        version: json['version'],
        url: json['url'],
        date: json['date'],
        patchInfo: _PatchInfo.fromJson(json['patchInfo']),
      );
}
