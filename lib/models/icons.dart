class Icons {
  String? frontDefault;
  dynamic frontFemale;

  Icons({this.frontDefault, this.frontFemale});

  factory Icons.fromJson(Map<String, dynamic> json) => Icons(
        frontDefault: json['front_default'] as String?,
        frontFemale: json['front_female'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'front_default': frontDefault,
        'front_female': frontFemale,
      };
}
