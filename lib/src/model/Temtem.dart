import 'package:temtem_api_wrapper/src/json_helper.dart';
import 'package:temtem_api_wrapper/src/model/Details.dart';
import 'package:temtem_api_wrapper/src/model/Evolution.dart';
import 'package:temtem_api_wrapper/src/model/GenderRatio.dart';
import 'package:temtem_api_wrapper/src/model/Stats.dart';
import 'package:temtem_api_wrapper/src/model/TemLocation.dart';

class Temtem {
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

  bool owned;

  Temtem({
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
    this.owned = false,
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

  factory Temtem.fromJson(Map<String, dynamic> json) {
    List<String> _types = [];
    if (json[JsonHelper.types] != null) {
      json[JsonHelper.types].forEach((item) => _types.add(item));
    }

    List<String> _traits = [];
    if (json[JsonHelper.traits] != null) {
      json[JsonHelper.traits].forEach((item) => _traits.add(item));
    }

    List<Map<String, dynamic>> _techniques = [];
    if (json[JsonHelper.techniques] != null) {
      json[JsonHelper.techniques].forEach((item) => _techniques.add({
            JsonHelper.name: item[JsonHelper.name],
            JsonHelper.source: item[JsonHelper.source],
            JsonHelper.levels: item[JsonHelper.levels],
          }));
    }

    List<String> _trivia = [];
    if (json[JsonHelper.trivia] != null) {
      json[JsonHelper.trivia].forEach((item) => _trivia.add(item));
    }

    List<TemLocation> _locations = [];
    if (json[JsonHelper.locations] != null) {
      json[JsonHelper.locations]
          .forEach((item) => _locations.add(TemLocation.fromJson(item)));
    }

    return Temtem(
      number: json[JsonHelper.number],
      name: json[JsonHelper.name],
      types: _types,
      portraitWikiUrl: json[JsonHelper.portraitWikiUrl],
      lumaPortraitWikiUrl: json[JsonHelper.lumaPortraitWikiUrl],
      wikiUrl: json[JsonHelper.wikiUrl],
      stats: Stats.fromJson(json[JsonHelper.stats]),
      traits: _traits,
      details: Details.fromJson(json[JsonHelper.details]),
      techniques: _techniques,
      trivia: _trivia,
      evolution: Evolution.fromJson(json[JsonHelper.evolution]),
      wikiPortraitUrlLarge: json[JsonHelper.wikiPortraitUrlLarge],
      lumaWikiPortraitUrlLarge: json[JsonHelper.lumaWikiPortraitUrlLarge],
      locations: _locations,
      icon: json[JsonHelper.icon],
      lumaIcon: json[JsonHelper.lumaIcon],
      genderRatio: GenderRatio.fromJson(json[JsonHelper.genderRatio]),
      catchRate: json[JsonHelper.catchRate],
      tvYields: Stats.fromTvYieldsJson(json[JsonHelper.tvYields]),
      gameDescription: json[JsonHelper.gameDescription],
    );
  }
}
