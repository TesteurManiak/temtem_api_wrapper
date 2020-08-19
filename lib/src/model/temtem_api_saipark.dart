class _Place {
  final String temtem;
  final int lumaRate;
  final int minSvs;
  final int eggMoves;

  _Place({this.temtem, this.lumaRate, this.minSvs, this.eggMoves});

  factory _Place.fromJson(Map<String, dynamic> json) => _Place(
        temtem: json['temtem'],
        lumaRate: json['lumaRate'],
        minSvs: json['minSvs'],
        eggMoves: json['eggMoves'],
      );
}

class TemTemApiSaipark {
  final String dateRange;
  final String startDate;
  final String endDate;
  final List<_Place> land;
  final List<_Place> water;

  TemTemApiSaipark({
    this.dateRange,
    this.startDate,
    this.endDate,
    this.land,
    this.water,
  });

  factory TemTemApiSaipark.fromJson(Map<String, dynamic> json) =>
      TemTemApiSaipark(
        dateRange: json['dateRange'],
        startDate: json['startDate'],
        endDate: json['endDate'],
        land: List<_Place>.generate(
            json['land'] == null ? 0 : json['land'].length,
            (index) => _Place.fromJson(json['land'][index])),
        water: List<_Place>.generate(
            json['water'] == null ? 0 : json['water'].length,
            (index) => _Place.fromJson(json['water'][index])),
      );
}
