class Emerald {
  String? frontDefault;
  String? frontShiny;

  Emerald({this.frontDefault, this.frontShiny});

  factory Emerald.fromJson(Map<String, dynamic> json) => Emerald(
        frontDefault: json['front_default'] as String?,
        frontShiny: json['front_shiny'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'front_default': frontDefault,
        'front_shiny': frontShiny,
      };
}
