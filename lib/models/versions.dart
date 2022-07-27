import 'generation_i.dart';
import 'generation_ii.dart';
import 'generation_iii.dart';
import 'generation_iv.dart';
import 'generation_v.dart';
import 'generation_vi.dart';
import 'generation_vii.dart';
import 'generation_viii.dart';

class Versions {
  GenerationI? generationI;
  GenerationIi? generationIi;
  GenerationIii? generationIii;
  GenerationIv? generationIv;
  GenerationV? generationV;
  GenerationVi? generationVi;
  GenerationVii? generationVii;
  GenerationViii? generationViii;

  Versions({
    this.generationI,
    this.generationIi,
    this.generationIii,
    this.generationIv,
    this.generationV,
    this.generationVi,
    this.generationVii,
    this.generationViii,
  });

  factory Versions.fromJson(Map<String, dynamic> json) => Versions(
        generationI: json['generation-i'] == null
            ? null
            : GenerationI.fromJson(
                json['generation-i'] as Map<String, dynamic>),
        generationIi: json['generation-ii'] == null
            ? null
            : GenerationIi.fromJson(
                json['generation-ii'] as Map<String, dynamic>),
        generationIii: json['generation-iii'] == null
            ? null
            : GenerationIii.fromJson(
                json['generation-iii'] as Map<String, dynamic>),
        generationIv: json['generation-iv'] == null
            ? null
            : GenerationIv.fromJson(
                json['generation-iv'] as Map<String, dynamic>),
        generationV: json['generation-v'] == null
            ? null
            : GenerationV.fromJson(
                json['generation-v'] as Map<String, dynamic>),
        generationVi: json['generation-vi'] == null
            ? null
            : GenerationVi.fromJson(
                json['generation-vi'] as Map<String, dynamic>),
        generationVii: json['generation-vii'] == null
            ? null
            : GenerationVii.fromJson(
                json['generation-vii'] as Map<String, dynamic>),
        generationViii: json['generation-viii'] == null
            ? null
            : GenerationViii.fromJson(
                json['generation-viii'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'generation-i': generationI?.toJson(),
        'generation-ii': generationIi?.toJson(),
        'generation-iii': generationIii?.toJson(),
        'generation-iv': generationIv?.toJson(),
        'generation-v': generationV?.toJson(),
        'generation-vi': generationVi?.toJson(),
        'generation-vii': generationVii?.toJson(),
        'generation-viii': generationViii?.toJson(),
      };
}
