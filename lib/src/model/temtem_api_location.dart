class Location {
  final String name;
  final String wikiUrl;
  final String type;

  Location({this.name, this.wikiUrl, this.type});

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        name: json['name'],
        wikiUrl: json['wikiUrl'],
        type: json['type'],
      );
}

class TemTemApiLocation {
  final String name;
  final String wikiUrl;
  final String description;
  final List<String> temtemTypes;
  final String type;
  final String imageWikiThumbnail;
  final String imageWikiFile;
  final List<Location> routes;
  final List<Location> townsAndVillages;
  final List<Location> landmarks;
  final List<String> temtem;
  final List<String> trivia;

  TemTemApiLocation({
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

  factory TemTemApiLocation.fromJson(Map<String, dynamic> json) =>
      TemTemApiLocation(
        name: json['name'],
        wikiUrl: json['wikiUrl'],
        description: json['description'],
        temtemTypes: List<String>.from(json['temtemTypes']),
        type: json['type'],
        imageWikiThumbnail: json['imageWikiThumbnail'],
        imageWikiFile: json['imageWikiFile'],
        routes: List<Location>.generate(
            json['routes'] == null ? 0 : json['routes'].length,
            (index) => Location.fromJson(json['routes'][index])),
        townsAndVillages: List<Location>.generate(
            json['townsAndVillages'] == null
                ? 0
                : json['townsAndVillages'].length,
            (index) => Location.fromJson(json['townsAndVillages'][index])),
        landmarks: List<Location>.generate(
            json['landmarks'] == null ? 0 : json['landmarks'].length,
            (index) => Location.fromJson(json['landmarks'][index])),
        temtem: List<String>.from(json['temtem']),
        trivia: List<String>.from(json['trivia']),
      );
}
