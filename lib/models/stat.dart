import 'stat.dart';

class Stat {
  int? baseStat;
  int? effort;
  Stat? stat;

  Stat({this.baseStat, this.effort, this.stat});

  factory Stat.fromJson(Map<String, dynamic> json) => Stat(
        baseStat: json['base_stat'] as int?,
        effort: json['effort'] as int?,
        stat: json['stat'] == null
            ? null
            : Stat.fromJson(json['stat'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'base_stat': baseStat,
        'effort': effort,
        'stat': stat?.toJson(),
      };
}
