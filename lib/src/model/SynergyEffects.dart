class SynergyEffects {
  final String effect;
  final String type;
  final int damage;

  SynergyEffects({this.effect, this.type, this.damage});

  factory SynergyEffects.fromJson(Map<String, dynamic> json) {
    return SynergyEffects(
      effect: json['effect'],
      type: json['type'],
      damage: json['damage'],
    );
  }
}
