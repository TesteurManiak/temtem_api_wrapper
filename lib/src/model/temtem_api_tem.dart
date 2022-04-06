class _Stats {
  final int hp;
  final int sta;
  final int spd;
  final int atk;
  final int def;
  final int spatk;
  final int spdef;

  _Stats({
    required this.hp,
    required this.sta,
    required this.spd,
    required this.atk,
    required this.def,
    required this.spatk,
    required this.spdef,
  });

  factory _Stats.fromJson(Map<String, dynamic> json) => _Stats(
        hp: json['hp'],
        sta: json['sta'],
        spd: json['spd'],
        atk: json['atk'],
        def: json['def'],
        spatk: json['spatk'],
        spdef: json['spdef'],
      );
}

class _BaseStats extends _Stats {
  final int total;

  _BaseStats({
    required int hp,
    required int sta,
    required int spd,
    required int atk,
    required int def,
    required int spatk,
    required int spdef,
    required this.total,
  }) : super(
          hp: hp,
          sta: sta,
          spd: spd,
          atk: atk,
          def: def,
          spatk: spatk,
          spdef: spdef,
        );

  factory _BaseStats.fromJson(Map<String, dynamic> json) {
    return _BaseStats(
      hp: json['hp'] as int,
      sta: json['sta'] as int,
      spd: json['spd'] as int,
      atk: json['atk'] as int,
      def: json['def'] as int,
      spatk: json['spatk'] as int,
      spdef: json['spdef'] as int,
      total: json['total'] as int,
    );
  }
}

class _Details {
  final int heightCm;
  final int heightInches;
  final int weightKg;
  final int weightLbs;

  _Details({
    required this.heightCm,
    required this.heightInches,
    required this.weightKg,
    required this.weightLbs,
  });

  factory _Details.fromJson(Map<String, dynamic> json) {
    return _Details(
      heightCm: json['height']['cm'],
      heightInches: json['height']['inches'],
      weightKg: json['weight']['kg'],
      weightLbs: json['weight']['lbs'],
    );
  }
}

class Technique {
  final String name;
  final String source;
  final int? levels;

  Technique({
    required this.name,
    required this.source,
    required this.levels,
  });

  factory Technique.fromJson(Map<String, dynamic> json) => Technique(
        name: json['name'],
        source: json['source'],
        levels: json['levels'] as int?,
      );
}

class EvolutionNode {
  final int number;
  final String name;
  final int stage;
  final num? levels;
  final bool? trading;
  final Map<String, dynamic> traitMapping;

  EvolutionNode({
    required this.number,
    required this.name,
    required this.stage,
    required this.levels,
    required this.trading,
    required this.traitMapping,
  });

  factory EvolutionNode.fromJson(Map<String, dynamic> json) => EvolutionNode(
        number: json['number'],
        name: json['name'],
        stage: json['stage'],
        levels: json['levels'] as num?,
        trading: json['trading'] as bool?,
        traitMapping: json['traitMapping'],
      );
}

class _Evolution {
  final int stage;
  final List<EvolutionNode> evolutionTree;
  final bool evolves;
  final String type;
  final String? description;

  _Evolution({
    required this.stage,
    required this.evolutionTree,
    required this.evolves,
    required this.type,
    required this.description,
  });

  factory _Evolution.fromJson(Map<String, dynamic> json) => _Evolution(
        stage: json['stage'],
        evolutionTree: List<EvolutionNode>.generate(
            json['evolutionTree'] == null ? 0 : json['evolutionTree'].length,
            (index) => EvolutionNode.fromJson(json['evolutionTree'][index])),
        evolves: json['evolves'],
        type: json['type'] as String,
        description: json['description'] as String?,
      );
}

class _FreeTem {
  final int minLevel;
  final int maxLevel;
  final int minPansuns;
  final int maxPansuns;

  _FreeTem({
    required this.minLevel,
    required this.maxLevel,
    required this.minPansuns,
    required this.maxPansuns,
  });

  factory _FreeTem.fromJson(Map<String, dynamic> json) {
    return _FreeTem(
      minLevel: json['minLevel'],
      maxLevel: json['maxLevel'],
      minPansuns: json['minPansuns'],
      maxPansuns: json['maxPansuns'],
    );
  }
}

class TemLocation {
  final String location;
  final String place;
  final String note;
  final String island;
  final String frequency;
  final String level;
  final _FreeTem freeTem;

  TemLocation({
    required this.location,
    required this.place,
    required this.note,
    required this.island,
    required this.frequency,
    required this.level,
    required this.freeTem,
  });

  factory TemLocation.fromJson(Map<String, dynamic> json) {
    return TemLocation(
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

  _GenderRatio({required this.male, required this.female});

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
  final String? lumaPortraitWikiUrl;
  final List<String> traits;
  final _Details details;
  final List<Technique> techniques;
  final List<String> trivia;
  final _Evolution evolution;
  final String wikiPortraitUrlLarge;
  final String? lumaWikiPortraitUrlLarge;
  final List<TemLocation> locations;
  final String icon;
  final String lumaIcon;
  final _GenderRatio genderRatio;
  final int catchRate;
  final _Stats tvYields;
  final String gameDescription;
  final String? wikiRenderStaticUrl;
  final String? wikiRenderAnimatedUrl;
  final String? wikiRenderStaticLumaUrl;
  final String? wikiRenderAnimatedLumaUrl;
  final String? renderStaticImage;
  final String? renderStaticLumaImage;
  final String? renderAnimatedImage;
  final String? renderAnimatedLumaImage;

  TemTemApiTem({
    required this.number,
    required this.name,
    required this.types,
    required this.portraitWikiUrl,
    required this.lumaPortraitWikiUrl,
    required this.wikiUrl,
    required this.stats,
    required this.traits,
    required this.details,
    required this.techniques,
    required this.trivia,
    required this.evolution,
    required this.wikiPortraitUrlLarge,
    required this.lumaWikiPortraitUrlLarge,
    required this.locations,
    required this.icon,
    required this.lumaIcon,
    required this.genderRatio,
    required this.catchRate,
    required this.tvYields,
    required this.gameDescription,
    required this.wikiRenderStaticUrl,
    required this.wikiRenderAnimatedUrl,
    required this.wikiRenderStaticLumaUrl,
    required this.wikiRenderAnimatedLumaUrl,
    required this.renderStaticImage,
    required this.renderStaticLumaImage,
    required this.renderAnimatedImage,
    required this.renderAnimatedLumaImage,
  });

  factory TemTemApiTem.fromJson(Map<String, dynamic> json) {
    return TemTemApiTem(
      number: json['number'],
      name: json['name'],
      types: List<String>.from(json['types']),
      portraitWikiUrl: json['portraitWikiUrl'],
      lumaPortraitWikiUrl: json['lumaPortraitWikiUrl'],
      wikiUrl: json['wikiUrl'],
      stats: _BaseStats.fromJson(json['stats']),
      traits: List<String>.from(json['traits']),
      details: _Details.fromJson(json['details']),
      techniques: Iterable<Technique>.generate(json['techniques'].length,
          (index) => Technique.fromJson(json['techniques'][index])).toList(),
      trivia: List<String>.from(json['trivia']),
      evolution: _Evolution.fromJson(json['evolution']),
      wikiPortraitUrlLarge: json['wikiPortraitUrlLarge'],
      lumaWikiPortraitUrlLarge: json['lumaWikiPortraitUrlLarge'],
      locations: Iterable<TemLocation>.generate(json['locations'].length,
          (index) => TemLocation.fromJson(json['locations'][index])).toList(),
      icon: json['icon'],
      lumaIcon: json['lumaIcon'],
      genderRatio: _GenderRatio.fromJson(json['genderRatio']),
      catchRate: json['catchRate'],
      tvYields: _Stats.fromJson(json['tvYields']),
      gameDescription: json['gameDescription'],
      wikiRenderStaticUrl: json['wikiRenderStaticUrl'],
      renderStaticImage: json['renderStaticImage'],
      wikiRenderStaticLumaUrl: json['wikiRenderStaticLumaUrl'],
      wikiRenderAnimatedUrl: json['wikiRenderAnimatedUrl'],
      renderAnimatedImage: json['renderAnimatedImage'],
      wikiRenderAnimatedLumaUrl: json['wikiRenderAnimatedLumaUrl'],
      renderStaticLumaImage: json['renderStaticLumaImage'],
      renderAnimatedLumaImage: json['renderAnimatedLumaImage'],
    );
  }
}
