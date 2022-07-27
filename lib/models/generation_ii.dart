import 'crystal.dart';
import 'gold.dart';
import 'silver.dart';

class GenerationIi {
  Crystal? crystal;
  Gold? gold;
  Silver? silver;

  GenerationIi({this.crystal, this.gold, this.silver});

  factory GenerationIi.fromJson(Map<String, dynamic> json) => GenerationIi(
        crystal: json['crystal'] == null
            ? null
            : Crystal.fromJson(json['crystal'] as Map<String, dynamic>),
        gold: json['gold'] == null
            ? null
            : Gold.fromJson(json['gold'] as Map<String, dynamic>),
        silver: json['silver'] == null
            ? null
            : Silver.fromJson(json['silver'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'crystal': crystal?.toJson(),
        'gold': gold?.toJson(),
        'silver': silver?.toJson(),
      };
}
