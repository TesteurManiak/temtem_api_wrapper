class TemTemApiWeakness {
  final Map<String, dynamic> weaknesses;

  TemTemApiWeakness({this.weaknesses});

  factory TemTemApiWeakness.fromJson(Map<String, dynamic> json) =>
      TemTemApiWeakness(weaknesses: Map.from(json));
}
