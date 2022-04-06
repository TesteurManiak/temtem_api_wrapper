class TemTemApiWeaknessCalc {
  final String attacking;
  final List<String> defending;
  final List<double> modifiers;
  final double result;

  TemTemApiWeaknessCalc({
    required this.attacking,
    required this.defending,
    required this.modifiers,
    required this.result,
  });

  factory TemTemApiWeaknessCalc.fromJson(Map<String, dynamic> json) =>
      TemTemApiWeaknessCalc(
        attacking: json['attacking'] as String,
        defending: List<String>.from(json['defending'] as Iterable),
        modifiers: List<double>.from(json['modifiers'] as Iterable),
        result: json['result'] as double,
      );
}
