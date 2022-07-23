import 'diamond_pearl.dart';
import 'heartgold_soulsilver.dart';
import 'platinum.dart';

class GenerationIv {
  DiamondPearl? diamondPearl;
  HeartgoldSoulsilver? heartgoldSoulsilver;
  Platinum? platinum;

  GenerationIv({
    this.diamondPearl,
    this.heartgoldSoulsilver,
    this.platinum,
  });

  factory GenerationIv.fromJson(Map<String, dynamic> json) => GenerationIv(
        diamondPearl: json['diamond-pearl'] == null
            ? null
            : DiamondPearl.fromJson(
                json['diamond-pearl'] as Map<String, dynamic>),
        heartgoldSoulsilver: json['heartgold-soulsilver'] == null
            ? null
            : HeartgoldSoulsilver.fromJson(
                json['heartgold-soulsilver'] as Map<String, dynamic>),
        platinum: json['platinum'] == null
            ? null
            : Platinum.fromJson(json['platinum'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'diamond-pearl': diamondPearl?.toJson(),
        'heartgold-soulsilver': heartgoldSoulsilver?.toJson(),
        'platinum': platinum?.toJson(),
      };
}
