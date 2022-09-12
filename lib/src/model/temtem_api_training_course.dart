class TemTemApiTrainingCourse {
  final String number;
  final String technique;
  final String type;
  final String location;
  final String locationType;

  TemTemApiTrainingCourse({
    required this.number,
    required this.technique,
    required this.type,
    required this.location,
    required this.locationType,
  });

  factory TemTemApiTrainingCourse.fromJson(Map<String, dynamic> json) =>
      TemTemApiTrainingCourse(
        number: json['number'] as String,
        technique: json['technique'] as String,
        type: json['type'] as String,
        location: json['location'] as String,
        locationType: json['locationType'] as String,
      );
}
