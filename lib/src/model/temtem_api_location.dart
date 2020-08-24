class _Location {
  final String name;
  final String wikiUrl;
  final String type;

  _Location({this.name, this.wikiUrl, this.type});

  factory _Location.fromJson(Map<String, dynamic> json) => _Location(
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
  final List<_Location> routes;
  final List<_Location> townsAndVillages;
  final List<_Location> landmarks;
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
        routes: List<_Location>.generate(
            json['routes'] == null ? 0 : json['routes'].length,
            (index) => _Location.fromJson(json['routes'][index])),
        townsAndVillages: List<_Location>.generate(
            json['townsAndVillages'] == null
                ? 0
                : json['townsAndVillages'].length,
            (index) => _Location.fromJson(json['townsAndVillages'][index])),
        landmarks: List<_Location>.generate(
            json['landmarks'] == null ? 0 : json['landmarks'].length,
            (index) => _Location.fromJson(json['landmarks'][index])),
        temtem: List<String>.from(json['temtem']),
        trivia: List<String>.from(json['trivia']),
      );
}
