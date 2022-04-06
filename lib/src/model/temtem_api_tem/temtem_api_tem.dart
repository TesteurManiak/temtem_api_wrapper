import 'package:collection/collection.dart';

part '_stats.dart';
part '_details.dart';
part '_technique.dart';
part '_evolution_node.dart';
part '_evolution.dart';
part '_free_tem.dart';

class TemLocation {
  final String location;
  final String place;
  final String note;
  final String island;
  final String frequency;
  final String level;
  final FreeTem freeTem;

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
      location: json['location'] as String,
      place: json['place'] as String,
      note: json['note'] as String,
      island: json['island'] as String,
      frequency: json['frequency'] as String,
      level: json['level'] as String,
      freeTem: FreeTem.fromJson(json['freetem'] as Map<String, dynamic>),
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
  final List<Technique>? techniques;
  final List<String> trivia;
  final Evolution evolution;
  final String wikiPortraitUrlLarge;
  final String? lumaWikiPortraitUrlLarge;
  final List<TemLocation>? locations;
  final String icon;
  final String lumaIcon;
  final GenderRatio genderRatio;
  final int catchRate;
  final int hatchMins;
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
    required this.hatchMins,
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
    final techniques =
        (json['techniques'] as Iterable?)?.cast<Map<String, dynamic>>();
    final locations =
        (json['locations'] as Iterable?)?.cast<Map<String, dynamic>>();

    return TemTemApiTem(
      number: json['number'] as int,
      name: json['name'] as String,
      types: List<String>.from(json['types'] as Iterable),
      portraitWikiUrl: json['portraitWikiUrl'] as String,
      lumaPortraitWikiUrl: json['lumaPortraitWikiUrl'] as String?,
      wikiUrl: json['wikiUrl'] as String,
      stats: Stats.fromJson(json['stats'] as Map<String, dynamic>),
      traits: List<String>.from(json['traits'] as Iterable),
      details: Details.fromJson(json['details'] as Map<String, dynamic>),
      techniques: techniques?.map(Technique.fromJson).toList(),
      trivia: List<String>.from(json['trivia'] as Iterable),
      evolution: Evolution.fromJson(json['evolution'] as Map<String, dynamic>),
      wikiPortraitUrlLarge: json['wikiPortraitUrlLarge'] as String,
      lumaWikiPortraitUrlLarge: json['lumaWikiPortraitUrlLarge'] as String?,
      locations: locations?.map(TemLocation.fromJson).toList(),
      icon: json['icon'] as String,
      lumaIcon: json['lumaIcon'] as String,
      genderRatio:
          GenderRatio.fromJson(json['genderRatio'] as Map<String, dynamic>),
      catchRate: json['catchRate'] as int,
      hatchMins: json['hatchMins'] as int,
      tvYields: Stats.fromJson(json['tvYields'] as Map<String, dynamic>),
      gameDescription: json['gameDescription'] as String,
      wikiRenderStaticUrl: json['wikiRenderStaticUrl'] as String?,
      renderStaticImage: json['renderStaticImage'] as String?,
      wikiRenderStaticLumaUrl: json['wikiRenderStaticLumaUrl'] as String?,
      wikiRenderAnimatedUrl: json['wikiRenderAnimatedUrl'] as String?,
      renderAnimatedImage: json['renderAnimatedImage'] as String?,
      wikiRenderAnimatedLumaUrl: json['wikiRenderAnimatedLumaUrl'] as String?,
      renderStaticLumaImage: json['renderStaticLumaImage'] as String?,
      renderAnimatedLumaImage: json['renderAnimatedLumaImage'] as String?,
    );
  }
}
