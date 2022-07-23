import 'emerald.dart';
import 'firered_leafgreen.dart';
import 'ruby_sapphire.dart';

class GenerationIii {
  Emerald? emerald;
  FireredLeafgreen? fireredLeafgreen;
  RubySapphire? rubySapphire;

  GenerationIii({this.emerald, this.fireredLeafgreen, this.rubySapphire});

  factory GenerationIii.fromJson(Map<String, dynamic> json) => GenerationIii(
        emerald: json['emerald'] == null
            ? null
            : Emerald.fromJson(json['emerald'] as Map<String, dynamic>),
        fireredLeafgreen: json['firered-leafgreen'] == null
            ? null
            : FireredLeafgreen.fromJson(
                json['firered-leafgreen'] as Map<String, dynamic>),
        rubySapphire: json['ruby-sapphire'] == null
            ? null
            : RubySapphire.fromJson(
                json['ruby-sapphire'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'emerald': emerald?.toJson(),
        'firered-leafgreen': fireredLeafgreen?.toJson(),
        'ruby-sapphire': rubySapphire?.toJson(),
      };
}
