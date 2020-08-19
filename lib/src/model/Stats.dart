class Stats {
  final int hp;
  final int sta;
  final int spd;
  final int atk;
  final int def;
  final int spatk;
  final int spdef;
  final int total;

  Stats({
    this.hp,
    this.sta,
    this.spd,
    this.atk,
    this.def,
    this.spatk,
    this.spdef,
    this.total,
  });

  factory Stats.fromJson(Map<String, dynamic> json) {
    return Stats(
      hp: json['hp'],
      sta: json['sta'],
      spd: json['spd'],
      atk: json['atk'],
      def: json['def'],
      spatk: json['spatk'],
      spdef: json['spdef'],
      total: json['total'],
    );
  }

  factory Stats.fromTvYieldsJson(Map<String, dynamic> json) {
    return Stats(
      hp: json['hp'],
      sta: json['sta'],
      spd: json['spd'],
      atk: json['atk'],
      def: json['def'],
      spatk: json['spatk'],
      spdef: json['spdef'],
      total: json['total'],
    );
  }
}
