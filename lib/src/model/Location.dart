class LocationElem {
  final String name;
  final String wikiUrl;
  final String type;

  LocationElem({this.name, this.wikiUrl, this.type});

  factory LocationElem.fromJson(Map<String, dynamic> json) {
    return LocationElem(
      name: json['name'],
      wikiUrl: json['wikiUrl'],
      type: json['type'],
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
      name: json['name'],
      wikiUrl: json['wikiUrl'],
      description: json['description'],
      temtemTypes: List<String>.from(json['temtemTypes'] as List),
      type: json['type'],
      imageWikiThumbnail: json['imageWikiThumbnail'],
      imageWikiFile: json['imageWikiFile'],
      routes: List<LocationElem>.generate(json['routes'].length,
          (index) => LocationElem.fromJson(json['routes'][index])),
      townsAndVillages: List<LocationElem>.generate(
          json['townsAndVillages'].length,
          (index) => LocationElem.fromJson(json[townsAndVillages][index])),
      landmarks: List<LocationElem>.generate(json['landmarks'].length,
          (index) => LocationElem.fromJson(json[landmarks][index])),
      temtem: List<String>.from(json['temtem'] as List),
      trivia: List<String>.from(json['trivia'] as List),
    );
  }
}
