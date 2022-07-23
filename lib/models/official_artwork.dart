class OfficialArtwork {
  String? frontDefault;

  OfficialArtwork({this.frontDefault});

  factory OfficialArtwork.fromJson(Map<String, dynamic> json) {
    return OfficialArtwork(
      frontDefault: json['front_default'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'front_default': frontDefault,
      };
}
