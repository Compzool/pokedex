import 'dream_world.dart';
import 'home.dart';
import 'official_artwork.dart';

class Other {
  DreamWorld? dreamWorld;
  Home? home;
  OfficialArtwork? officialArtwork;

  Other({this.dreamWorld, this.home, this.officialArtwork});

  factory Other.fromJson(Map<String, dynamic> json) => Other(
        dreamWorld: json['dream_world'] == null
            ? null
            : DreamWorld.fromJson(json['dream_world'] as Map<String, dynamic>),
        home: json['home'] == null
            ? null
            : Home.fromJson(json['home'] as Map<String, dynamic>),
        officialArtwork: json['official-artwork'] == null
            ? null
            : OfficialArtwork.fromJson(
                json['official-artwork'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'dream_world': dreamWorld?.toJson(),
        'home': home?.toJson(),
        'official-artwork': officialArtwork?.toJson(),
      };
}
