class TemTemApiWeaknessCalc {
  final String attacking;
  final List<String> defending;
  final List<double> modifiers;
  final double result;

  TemTemApiWeaknessCalc({
    this.attacking,
    this.defending,
    this.modifiers,
    this.result,
  });

  factory TemTemApiWeaknessCalc.fromJson(Map<String, dynamic> json) =>
      TemTemApiWeaknessCalc(
        attacking: json['attacking'],
        defending: List<String>.from(json['defending']),
        modifiers: List<double>.from(json['modifiers']),
        result: json['result'],
      );
}
