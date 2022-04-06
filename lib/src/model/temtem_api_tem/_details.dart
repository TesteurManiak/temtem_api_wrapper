part of 'temtem_api_tem.dart';

class Details {
  final int heightCm;
  final int heightInches;
  final int weightKg;
  final int weightLbs;

  Details({
    required this.heightCm,
    required this.heightInches,
    required this.weightKg,
    required this.weightLbs,
  });

  factory Details.fromJson(Map<String, dynamic> json) {
    final heightJson = json['height'] as Map<String, dynamic>;
    final weightJson = json['weight'] as Map<String, dynamic>;
    return Details(
      heightCm: heightJson['cm'] as int,
      heightInches: heightJson['inches'] as int,
      weightKg: weightJson['kg'] as int,
      weightLbs: weightJson['lbs'] as int,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Details &&
        other.heightCm == heightCm &&
        other.heightInches == heightInches &&
        other.weightKg == weightKg &&
        other.weightLbs == weightLbs;
  }

  @override
  int get hashCode {
    return heightCm.hashCode ^
        heightInches.hashCode ^
        weightKg.hashCode ^
        weightLbs.hashCode;
  }
}
