class Place {
  final String temtem;
  final int lumaRate;
  final int minSvs;
  final int eggMoves;

  Place({
    required this.temtem,
    required this.lumaRate,
    required this.minSvs,
    required this.eggMoves,
  });

  factory Place.fromJson(Map<String, dynamic> json) => Place(
        temtem: json['temtem'] as String,
        lumaRate: json['lumaRate'] as int,
        minSvs: json['minSvs'] as int,
        eggMoves: json['eggMoves'] as int,
      );
}

class TemTemApiSaipark {
  final String dateRange;
  final String startDate;
  final String endDate;
  final List<Place>? land;
  final List<Place>? water;

  TemTemApiSaipark({
    required this.dateRange,
    required this.startDate,
    required this.endDate,
    required this.land,
    required this.water,
  });

  factory TemTemApiSaipark.fromJson(Map<String, dynamic> json) {
    final land = (json['land'] as Iterable?)?.cast<Map<String, dynamic>>();
    final water = (json['water'] as Iterable?)?.cast<Map<String, dynamic>>();
    return TemTemApiSaipark(
      dateRange: json['dateRange'] as String,
      startDate: json['startDate'] as String,
      endDate: json['endDate'] as String,
      land: land?.map(Place.fromJson).toList(),
      water: water?.map(Place.fromJson).toList(),
    );
  }
}
