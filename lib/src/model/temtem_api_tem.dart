class _Stats {
  final int hp;
  final int sta;
  final int spd;
  final int atk;
  final int def;
  final int spatk;
  final int spdef;
  final int total;

  _Stats({
    this.hp,
    this.sta,
    this.spd,
    this.atk,
    this.def,
    this.spatk,
    this.spdef,
    this.total,
  });

  factory _Stats.fromJson(Map<String, dynamic> json) => _Stats(
        hp: json['hp'],
        sta: json['sta'],
        spd: json['spd'],
        atk: json['atk'],
        def: json['def'],
        spatk: json['spatk'],
        spdef: json['spdef'],
        total: json['total'],
      );

  factory _Stats.fromTvYieldsJson(Map<String, dynamic> json) => _Stats(
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

class _Details {
  final int heightCm;
  final int heightInches;
  final int weightKg;
  final int weightLbs;

  _Details({this.heightCm, this.heightInches, this.weightKg, this.weightLbs});

  factory _Details.fromJson(Map<String, dynamic> json) {
    return _Details(
      heightCm: json['height']['cm'],
      heightInches: json['height']['inches'],
      weightKg: json['weight']['kg'],
      weightLbs: json['weight']['lbs'],
    );
  }
}

class _Technique {
  final String name;
  final String source;
  final int levels;

  _Technique({this.name, this.source, this.levels});

  factory _Technique.fromJson(Map<String, dynamic> json) => _Technique(
      name: json['name'], source: json['source'], levels: json['levels']);
}

class _EvolutionNode {
  final int number;
  final String name;
  final int stage;
  final dynamic levels;
  final bool trading;
  final Map<String, dynamic> traitMapping;

  _EvolutionNode({
    this.number,
    this.name,
    this.stage,
    this.levels,
    this.trading,
    this.traitMapping,
  });

  factory _EvolutionNode.fromJson(Map<String, dynamic> json) => _EvolutionNode(
        number: json['number'],
        name: json['name'],
        stage: json['stage'],
        levels: json['levels'],
        trading: json['trading'],
        traitMapping: json['traitMapping'],
      );
}

class _Evolution {
  final int stage;
  final List<_EvolutionNode> evolutionTree;
  final bool evolves;
  final String type;
  final String description;

  _Evolution({
    this.stage,
    this.evolutionTree,
    this.evolves,
    this.type,
    this.description,
  });

  factory _Evolution.fromJson(Map<String, dynamic> json) => _Evolution(
        stage: json['stage'],
        evolutionTree: List<_EvolutionNode>.generate(
            json['evolutionTree'] == null ? 0 : json['evolutionTree'].length,
            (index) => _EvolutionNode.fromJson(json['evolutionTree'][index])),
        evolves: json['evolves'],
        type: json['type'],
        description: json['description'],
      );
}

class _FreeTem {
  final int minLevel;
  final int maxLevel;
  final int minPansuns;
  final int maxPansuns;

  _FreeTem({this.minLevel, this.maxLevel, this.minPansuns, this.maxPansuns});

  factory _FreeTem.fromJson(Map<String, dynamic> json) {
    return _FreeTem(
      minLevel: json['minLevel'],
      maxLevel: json['maxLevel'],
      minPansuns: json['minPansuns'],
      maxPansuns: json['maxPansuns'],
    );
  }
}

class _Location {
  final String location;
  final String place;
  final String note;
  final String island;
  final String frequency;
  final String level;
  final _FreeTem freeTem;

  _Location({
    this.location,
    this.place,
    this.note,
    this.island,
    this.frequency,
    this.level,
    this.freeTem,
  });

  factory _Location.fromJson(Map<String, dynamic> json) {
    return _Location(
      location: json['location'],
      place: json['place'],
      note: json['note'],
      island: json['island'],
      frequency: json['frequency'],
      level: json['level'],
      freeTem: _FreeTem.fromJson(json['freetem']),
    );
  }
}

class _GenderRatio {
  final double male;
  final double female;

  _GenderRatio({this.male, this.female});

  factory _GenderRatio.fromJson(Map<String, dynamic> json) => _GenderRatio(
        male: double.parse(json['male'].toString()),
        female: double.parse(json['female'].toString()),
      );
}

class TemTemApiTem {
  final int number;
  final String name;
  final List<String> types;
  final String portraitWikiUrl;
  final String wikiUrl;
  final _Stats stats;
  final String lumaPortraitWikiUrl;
  final List<String> traits;
  final _Details details;
  final List<_Technique> techniques;
  final List<String> trivia;
  final _Evolution evolution;
  final String wikiPortraitUrlLarge;
  final String lumaWikiPortraitUrlLarge;
  final List<_Location> locations;
  final String icon;
  final String lumaIcon;
  final _GenderRatio genderRatio;
  final int catchRate;
  final _Stats tvYields;
  final String gameDescription;
  final String wikiRenderStaticUrl;
  final String wikiRenderAnimatedUrl;
  final String wikiRenderStaticLumaUrl;
  final String wikiRenderAnimatedLumaUrl;
  final String renderStaticImage;
  final String renderStaticLumaImage;
  final String renderAnimatedImage;
  final String renderAnimatedLumaImage;

  TemTemApiTem({
    this.number,
    this.name,
    this.types,
    this.portraitWikiUrl,
    this.lumaPortraitWikiUrl,
    this.wikiUrl,
    this.stats,
    this.traits,
    this.details,
    this.techniques,
    this.trivia,
    this.evolution,
    this.wikiPortraitUrlLarge,
    this.lumaWikiPortraitUrlLarge,
    this.locations,
    this.icon,
    this.lumaIcon,
    this.genderRatio,
    this.catchRate,
    this.tvYields,
    this.gameDescription,
    this.wikiRenderStaticUrl,
    this.wikiRenderAnimatedUrl,
    this.wikiRenderStaticLumaUrl,
    this.wikiRenderAnimatedLumaUrl,
    this.renderStaticImage,
    this.renderStaticLumaImage,
    this.renderAnimatedImage,
    this.renderAnimatedLumaImage,
  });

  factory TemTemApiTem.fromJson(Map<String, dynamic> json) {
    return TemTemApiTem(
      number: json['number'],
      name: json['name'],
      types: List<String>.from(json['types']),
      portraitWikiUrl: json['portraitWikiUrl'],
      lumaPortraitWikiUrl: json['lumaPortraitWikiUrl'],
      wikiUrl: json['wikiUrl'],
      stats: _Stats.fromJson(json['stats']),
      traits: List<String>.from(json['traits']),
      details: _Details.fromJson(json['details']),
      techniques: Iterable<_Technique>.generate(json['techniques'].length,
          (index) => _Technique.fromJson(json['techniques'][index])).toList(),
      trivia: List<String>.from(json['trivia']),
      evolution: _Evolution.fromJson(json['evolution']),
      wikiPortraitUrlLarge: json['wikiPortraitUrlLarge'],
      lumaWikiPortraitUrlLarge: json['lumaWikiPortraitUrlLarge'],
      locations: Iterable<_Location>.generate(json['locations'].length,
          (index) => _Location.fromJson(json['locations'][index])).toList(),
      icon: json['icon'],
      lumaIcon: json['lumaIcon'],
      genderRatio: _GenderRatio.fromJson(json['genderRatio']),
      catchRate: json['catchRate'],
      tvYields: _Stats.fromTvYieldsJson(json['tvYields']),
      gameDescription: json['gameDescription'],
    );
  }
}
