import 'package:temtem_api_wrapper/src/json_helper.dart';

class LocationElem {
  final String name;
  final String wikiUrl;
  final String type;

  LocationElem({this.name, this.wikiUrl, this.type});

  factory LocationElem.fromJson(Map<String, dynamic> json) {
    return LocationElem(
      name: json[JsonHelper.name],
      wikiUrl: json[JsonHelper.wikiUrl],
      type: json[JsonHelper.type],
    );
  }
}

class Location {
  final String name;
  final String wikiUrl;
  final String description;
  final List<String> temtemTypes;
  final String type;
  final String imageWikiThumbnail;
  final String imageWikiFile;
  final List<LocationElem> routes;
  final List<LocationElem> townsAndVillages;
  final List<LocationElem> landmarks;
  final List<String> temtem;
  final List<String> trivia;

  Location({
    this.name,
    this.wikiUrl,
    this.description,
    this.temtemTypes,
    this.type,
    this.imageWikiThumbnail,
    this.imageWikiFile,
    this.routes,
    this.townsAndVillages,
    this.landmarks,
    this.temtem,
    this.trivia,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      name: json[JsonHelper.name],
      wikiUrl: json[JsonHelper.wikiUrl],
      description: json[JsonHelper.description],
      temtemTypes: List<String>.from(json[JsonHelper.temtemTypes] as List),
      type: json[JsonHelper.type],
      imageWikiThumbnail: json[JsonHelper.imageWikiThumbnail],
      imageWikiFile: json[JsonHelper.imageWikiFile],
      routes: List<LocationElem>.generate(json[JsonHelper.routes].length,
          (index) => LocationElem.fromJson(json[JsonHelper.routes][index])),
      townsAndVillages: List<LocationElem>.generate(
          json[JsonHelper.townsAndVillages].length,
          (index) =>
              LocationElem.fromJson(json[JsonHelper.townsAndVillages][index])),
      landmarks: List<LocationElem>.generate(json[JsonHelper.landmarks].length,
          (index) => LocationElem.fromJson(json[JsonHelper.landmarks][index])),
      temtem: List<String>.from(json[JsonHelper.temtem] as List),
      trivia: List<String>.from(json[JsonHelper.trivia] as List),
    );
  }
}
