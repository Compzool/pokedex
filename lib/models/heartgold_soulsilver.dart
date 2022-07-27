class HeartgoldSoulsilver {
  String? backDefault;
  dynamic backFemale;
  String? backShiny;
  dynamic backShinyFemale;
  String? frontDefault;
  dynamic frontFemale;
  String? frontShiny;
  dynamic frontShinyFemale;

  HeartgoldSoulsilver({
    this.backDefault,
    this.backFemale,
    this.backShiny,
    this.backShinyFemale,
    this.frontDefault,
    this.frontFemale,
    this.frontShiny,
    this.frontShinyFemale,
  });

  factory HeartgoldSoulsilver.fromJson(Map<String, dynamic> json) {
    return HeartgoldSoulsilver(
      backDefault: json['back_default'] as String?,
      backFemale: json['back_female'] as dynamic,
      backShiny: json['back_shiny'] as String?,
      backShinyFemale: json['back_shiny_female'] as dynamic,
      frontDefault: json['front_default'] as String?,
      frontFemale: json['front_female'] as dynamic,
      frontShiny: json['front_shiny'] as String?,
      frontShinyFemale: json['front_shiny_female'] as dynamic,
    );
  }

  Map<String, dynamic> toJson() => {
        'back_default': backDefault,
        'back_female': backFemale,
        'back_shiny': backShiny,
        'back_shiny_female': backShinyFemale,
        'front_default': frontDefault,
        'front_female': frontFemale,
        'front_shiny': frontShiny,
        'front_shiny_female': frontShinyFemale,
      };
}
