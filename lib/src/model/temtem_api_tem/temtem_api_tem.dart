import 'package:collection/collection.dart';
import 'package:temtem_api_wrapper/src/provider/http_provider.dart';

part 'details.dart';
part 'evolution.dart';
part 'evolution_node.dart';
part 'free_tem.dart';
part 'gender_ratio.dart';
part 'stats.dart';
part 'technique.dart';
part 'tem_location.dart';
part 'trait.dart';
part 'type.dart';

class TemTemApiTem {
  final int number;
  final String name;
  final List<Type> types;
  final String portraitWikiUrl;
  final String wikiUrl;
  final Stats stats;
  final String? lumaPortraitWikiUrl;
  final List<Trait> traits;
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
  final Map<String, dynamic>? weaknesses;

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
    required this.weaknesses,
  });

  factory TemTemApiTem.fromJson(Map<String, dynamic> json) {
    final traitsEntry = json['traits'] as Iterable;
    final traits = <Trait>[];
    for (final trait in traitsEntry) {
      if (trait is String) {
        traits.add(Trait.fromString(trait));
      } else {
        traits.add(Trait.fromJson(trait as Map<String, dynamic>));
      }
    }

    final typesEntry = json['types'] as Iterable;
    final types = <Type>[];
    for (final type in typesEntry) {
      if (type is String) {
        types.add(Type.fromString(type));
      } else {
        types.add(Type.fromJson(type as Map<String, dynamic>));
      }
    }

    return TemTemApiTem(
      number: json['number'] as int,
      name: json['name'] as String,
      types: types,
      portraitWikiUrl: json['portraitWikiUrl'] as String,
      lumaPortraitWikiUrl: json['lumaPortraitWikiUrl'] as String?,
      wikiUrl: json['wikiUrl'] as String,
      stats: Stats.fromJson(json['stats'] as Map<String, dynamic>),
      traits: traits,
      details: Details.fromJson(json['details'] as Map<String, dynamic>),
      techniques: (json['techniques'] as Iterable?)
          ?.cast<Map<String, dynamic>>()
          .map(Technique.fromJson)
          .toList(),
      trivia: List<String>.from(json['trivia'] as Iterable),
      evolution: Evolution.fromJson(json['evolution'] as Map<String, dynamic>),
      wikiPortraitUrlLarge: json['wikiPortraitUrlLarge'] as String,
      lumaWikiPortraitUrlLarge: json['lumaWikiPortraitUrlLarge'] as String?,
      locations: (json['locations'] as Iterable?)
          ?.cast<Map<String, dynamic>>()
          .map(TemLocation.fromJson)
          .toList(),
      icon: json['icon'] as String,
      lumaIcon: json['lumaIcon'] as String,
      genderRatio:
          GenderRatio.fromJson(json['genderRatio'] as Map<String, dynamic>),
      catchRate: json['catchRate'] as int,
      hatchMins: (json['hatchMins'] as num).toInt(),
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
      weaknesses: json['weaknesses'] as Map<String, dynamic>?,
    );
  }
}
