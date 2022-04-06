class Location {
  final String name;
  final String wikiUrl;
  final String type;

  Location({
    required this.name,
    required this.wikiUrl,
    required this.type,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        name: json['name'] as String,
        wikiUrl: json['wikiUrl'] as String,
        type: json['type'] as String,
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
  final List<Location>? routes;
  final List<Location>? townsAndVillages;
  final List<Location>? landmarks;
  final List<String> temtem;
  final List<String> trivia;

  TemTemApiLocation({
    required this.name,
    required this.wikiUrl,
    required this.description,
    required this.temtemTypes,
    required this.type,
    required this.imageWikiThumbnail,
    required this.imageWikiFile,
    required this.routes,
    required this.townsAndVillages,
    required this.landmarks,
    required this.temtem,
    required this.trivia,
  });

  factory TemTemApiLocation.fromJson(Map<String, dynamic> json) {
    final routes = (json['routes'] as Iterable?)?.cast<Map<String, dynamic>>();
    final townsAndVillages =
        (json['townsAndVillages'] as Iterable?)?.cast<Map<String, dynamic>>();
    final landmarks =
        (json['landmarks'] as Iterable?)?.cast<Map<String, dynamic>>();
    return TemTemApiLocation(
      name: json['name'] as String,
      wikiUrl: json['wikiUrl'] as String,
      description: json['description'] as String,
      temtemTypes: List<String>.from(json['temtemTypes'] as Iterable),
      type: json['type'] as String,
      imageWikiThumbnail: json['imageWikiThumbnail'] as String,
      imageWikiFile: json['imageWikiFile'] as String,
      routes: routes?.map(Location.fromJson).toList(),
      townsAndVillages: townsAndVillages?.map(Location.fromJson).toList(),
      landmarks: landmarks?.map(Location.fromJson).toList(),
      temtem: List<String>.from(json['temtem'] as Iterable),
      trivia: List<String>.from(json['trivia'] as Iterable),
    );
  }
}
