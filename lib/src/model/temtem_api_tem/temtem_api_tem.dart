import 'package:collection/collection.dart';

part '_stats.dart';
part '_details.dart';
part '_technique.dart';

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
    this.levels,
    this.trading,
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

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is EvolutionNode &&
        other.number == number &&
        other.name == name &&
        other.stage == stage &&
        other.levels == levels &&
        other.trading == trading &&
        const MapEquality().equals(other.traitMapping, traitMapping);
  }

  @override
  int get hashCode {
    return number.hashCode ^
        name.hashCode ^
        stage.hashCode ^
        levels.hashCode ^
        trading.hashCode ^
        traitMapping.hashCode;
  }
}

class Evolution {
  final int stage;
  final List<EvolutionNode> evolutionTree;
  final bool evolves;
  final String type;
  final String? description;

  Evolution({
    required this.stage,
    required this.evolutionTree,
    required this.evolves,
    required this.type,
    this.description,
  });

  factory Evolution.fromJson(Map<String, dynamic> json) {
    return Evolution(
      stage: json['stage'],
      evolutionTree: (json['evolutionTree'] as Iterable)
          .cast<Map<String, dynamic>>()
          .map(EvolutionNode.fromJson)
          .toList(),
      evolves: json['evolves'],
      type: json['type'] as String,
      description: json['description'] as String?,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Evolution &&
        other.stage == stage &&
        const ListEquality().equals(other.evolutionTree, evolutionTree) &&
        other.evolves == evolves &&
        other.type == type &&
        other.description == description;
  }

  @override
  int get hashCode {
    return stage.hashCode ^
        evolutionTree.hashCode ^
        evolves.hashCode ^
        type.hashCode ^
        description.hashCode;
  }
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

class GenderRatio {
  final double male;
  final double female;

  GenderRatio({required this.male, required this.female});

  factory GenderRatio.fromJson(Map<String, dynamic> json) => GenderRatio(
        male: double.parse(json['male'].toString()),
        female: double.parse(json['female'].toString()),
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GenderRatio && other.male == male && other.female == female;
  }

  @override
  int get hashCode => male.hashCode ^ female.hashCode;
}

class TemTemApiTem {
  final int number;
  final String name;
  final List<String> types;
  final String portraitWikiUrl;
  final String wikiUrl;
  final Stats stats;
  final String? lumaPortraitWikiUrl;
  final List<String> traits;
  final Details details;
  final List<Technique> techniques;
  final List<String> trivia;
  final Evolution evolution;
  final String wikiPortraitUrlLarge;
  final String? lumaWikiPortraitUrlLarge;
  final List<TemLocation> locations;
  final String icon;
  final String lumaIcon;
  final GenderRatio genderRatio;
  final int catchRate;
  final Stats tvYields;
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
      stats: Stats.fromJson(json['stats']),
      traits: List<String>.from(json['traits']),
      details: Details.fromJson(json['details']),
      techniques: Iterable<Technique>.generate(json['techniques'].length,
          (index) => Technique.fromJson(json['techniques'][index])).toList(),
      trivia: List<String>.from(json['trivia']),
      evolution: Evolution.fromJson(json['evolution']),
      wikiPortraitUrlLarge: json['wikiPortraitUrlLarge'],
      lumaWikiPortraitUrlLarge: json['lumaWikiPortraitUrlLarge'],
      locations: Iterable<TemLocation>.generate(json['locations'].length,
          (index) => TemLocation.fromJson(json['locations'][index])).toList(),
      icon: json['icon'],
      lumaIcon: json['lumaIcon'],
      genderRatio: GenderRatio.fromJson(json['genderRatio']),
      catchRate: json['catchRate'],
      tvYields: Stats.fromJson(json['tvYields']),
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
