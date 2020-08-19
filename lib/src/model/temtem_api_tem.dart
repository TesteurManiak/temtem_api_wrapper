import 'package:temtem_api_wrapper/src/model/Details.dart';
import 'package:temtem_api_wrapper/src/model/Evolution.dart';
import 'package:temtem_api_wrapper/src/model/GenderRatio.dart';
import 'package:temtem_api_wrapper/src/model/Stats.dart';
import 'package:temtem_api_wrapper/src/model/TemLocation.dart';

class TemTemApiTem {
  final int number;
  final String name;
  final List<String> types;
  final String portraitWikiUrl;
  final String lumaPortraitWikiUrl;
  final String wikiUrl;
  final Stats stats;
  final List<String> traits;
  final Details details;
  final List<Map<String, dynamic>> techniques;
  final List<String> trivia;
  final Evolution evolution;
  final String wikiPortraitUrlLarge;
  final String lumaWikiPortraitUrlLarge;
  final List<TemLocation> locations;
  final String icon;
  final String lumaIcon;
  final GenderRatio genderRatio;
  final int catchRate;
  final Stats tvYields;
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
    List<Map<String, dynamic>> _techniques = [];
    if (json['techniques'] != null) {
      json['techniques'].forEach((item) => _techniques.add({
            'name': item['name'],
            'source': item['source'],
            'levels': item['levels'],
          }));
    }

    List<TemLocation> _locations = [];
    if (json['locations'] != null) {
      json['locations']
          .forEach((item) => _locations.add(TemLocation.fromJson(item)));
    }

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
      techniques: _techniques,
      trivia: List<String>.from(json['trivia']),
      evolution: Evolution.fromJson(json['evolution']),
      wikiPortraitUrlLarge: json['wikiPortraitUrlLarge'],
      lumaWikiPortraitUrlLarge: json['lumaWikiPortraitUrlLarge'],
      locations: _locations,
      icon: json['icon'],
      lumaIcon: json['lumaIcon'],
      genderRatio: GenderRatio.fromJson(json['genderRatio']),
      catchRate: json['catchRate'],
      tvYields: Stats.fromTvYieldsJson(json['tvYields']),
      gameDescription: json['gameDescription'],
    );
  }
}
