part of 'temtem_api_tem.dart';

class GenderRatio {
  final double male;
  final double female;

  GenderRatio({required this.male, required this.female});

  factory GenderRatio.fromJson(Map<String, dynamic> json) => GenderRatio(
        male: double.parse(json['male'].toString()),
        female: double.parse(json['female'].toString()),
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GenderRatio && other.male == male && other.female == female;
  }

  @override
  int get hashCode => male.hashCode ^ female.hashCode;
}
