class TemTemApiTrainingCourse {
  final String number;
  final String technique;
  final String type;
  final String location;
  final String locationType;

  TemTemApiTrainingCourse({
    this.number,
    this.technique,
    this.type,
    this.location,
    this.locationType,
  });

  factory TemTemApiTrainingCourse.fromJson(Map<String, dynamic> json) =>
      TemTemApiTrainingCourse(
        number: json['number'],
        technique: json['technique'],
        type: json['type'],
        location: json['location'],
        locationType: json['locationType'],
      );
}
