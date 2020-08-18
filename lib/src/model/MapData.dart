class MapPoint {
  final int top;
  final int left;
  final List<int> temtemsNum;

  MapPoint({this.top, this.left, this.temtemsNum});

  factory MapPoint.fromJson(Map<String, dynamic> json) {
    return MapPoint(
      top: json['top'],
      left: json['left'],
      temtemsNum: List<int>.from(json['temtems'] as List),
    );
  }
}

class MapData {
  final String name;
  final int maxHeight;
  final int maxWidth;
  final String url;
  final List<MapPoint> points;

  MapData({this.name, this.maxHeight, this.maxWidth, this.url, this.points});

  factory MapData.fromJson(Map<String, dynamic> json, String name) {
    List<MapPoint> _points = [];
    json['mapWaypoint'].forEach((item) => _points.add(MapPoint.fromJson(item)));

    return MapData(
      name: name,
      maxHeight: json['maxHeight'],
      maxWidth: json['maxWidth'],
      url: json['url'],
      points: _points,
    );
  }
}
