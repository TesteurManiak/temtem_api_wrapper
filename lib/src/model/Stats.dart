import 'package:temtem_api_wrapper/src/JsonHelper.dart';

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
      hp: json[JsonHelper.hp],
      sta: json[JsonHelper.sta],
      spd: json[JsonHelper.spd],
      atk: json[JsonHelper.atk],
      def: json[JsonHelper.def],
      spatk: json[JsonHelper.spatk],
      spdef: json[JsonHelper.spdef],
      total: json[JsonHelper.total],
    );
  }

  factory Stats.fromTvYieldsJson(Map<String, dynamic> json) {
    return Stats(
      hp: json[JsonHelper.hp],
      sta: json[JsonHelper.sta],
      spd: json[JsonHelper.spd],
      atk: json[JsonHelper.atk],
      def: json[JsonHelper.def],
      spatk: json[JsonHelper.spatk],
      spdef: json[JsonHelper.spdef],
      total: json[JsonHelper.total],
    );
  }
}
