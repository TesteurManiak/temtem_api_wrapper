part of 'temtem_api_tem.dart';

class Stats {
  final int hp;
  final int sta;
  final int spd;
  final int atk;
  final int def;
  final int spatk;
  final int spdef;
  final int? _total;

  int get total => _total ?? (hp + sta + spd + atk + def + spatk + spdef);

  Stats({
    required this.hp,
    required this.sta,
    required this.spd,
    required this.atk,
    required this.def,
    required this.spatk,
    required this.spdef,
    int? total,
  }) : _total = total;

  factory Stats.fromJson(Map<String, dynamic> json) => Stats(
        hp: json['hp'] as int,
        sta: json['sta'] as int,
        spd: json['spd'] as int,
        atk: json['atk'] as int,
        def: json['def'] as int,
        spatk: json['spatk'] as int,
        spdef: json['spdef'] as int,
        total: json['total'] as int?,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Stats &&
        other.hp == hp &&
        other.sta == sta &&
        other.spd == spd &&
        other.atk == atk &&
        other.def == def &&
        other.spatk == spatk &&
        other.spdef == spdef &&
        other._total == _total;
  }

  @override
  int get hashCode {
    return hp.hashCode ^
        sta.hashCode ^
        spd.hashCode ^
        atk.hashCode ^
        def.hashCode ^
        spatk.hashCode ^
        spdef.hashCode ^
        _total.hashCode;
  }
}
