class TemTemApiFreeTem {
  final String temtem;
  final int level;
  final int catchRate;
  final int reward;

  TemTemApiFreeTem({
    this.temtem,
    this.level,
    this.catchRate,
    this.reward,
  });

  factory TemTemApiFreeTem.fromJson(Map<String, dynamic> json) =>
      TemTemApiFreeTem(
        temtem: json['temtem'],
        level: json['level'],
        catchRate: json['catchRate'],
        reward: json['reward'],
      );
}
