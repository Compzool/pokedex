import 'poke_stats.dart';

class Stat {
  int? baseStat;
  int? effort;
  PokeStats? pokeStats;

  Stat({this.baseStat, this.effort, this.pokeStats});

  factory Stat.fromJson(Map<String, dynamic> json) => Stat(
        baseStat: json['base_stat'] as int?,
        effort: json['effort'] as int?,
        pokeStats: json['stat'] == null
            ? null
            : PokeStats.fromJson(json['stat'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'base_stat': baseStat,
        'effort': effort,
        'poke_stats': pokeStats?.toJson(),
      };
}
