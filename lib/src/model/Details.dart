class Details {
  final int heightCm;
  final int heightInches;
  final int weightKg;
  final int weightLbs;

  Details({this.heightCm, this.heightInches, this.weightKg, this.weightLbs});

  factory Details.fromJson(Map<String, dynamic> json) {
    return Details(
      heightCm: json['height']['cm'],
      heightInches: json['height']['inches'],
      weightKg: json['weight']['kg'],
      weightLbs: json['weight']['lbs'],
    );
  }
}
