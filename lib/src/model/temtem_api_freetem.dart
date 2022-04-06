class TemTemApiFreetem {
  final String temtem;
  final int level;
  final int catchRate;
  final int reward;

  TemTemApiFreetem({
    required this.temtem,
    required this.level,
    required this.catchRate,
    required this.reward,
  });

  factory TemTemApiFreetem.fromJson(Map<String, dynamic> json) =>
      TemTemApiFreetem(
        temtem: json['temtem'],
        level: json['level'],
        catchRate: json['catchRate'],
        reward: json['reward'],
      );
}
