class DreamWorld {
  String? frontDefault;
  dynamic frontFemale;

  DreamWorld({this.frontDefault, this.frontFemale});

  factory DreamWorld.fromJson(Map<String, dynamic> json) => DreamWorld(
        frontDefault: json['front_default'] as String?,
        frontFemale: json['front_female'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'front_default': frontDefault,
        'front_female': frontFemale,
      };
}
