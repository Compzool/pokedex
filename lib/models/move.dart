import 'move.dart';
import 'version_group_detail.dart';

class Move {
  Move? move;
  List<VersionGroupDetail>? versionGroupDetails;

  Move({this.move, this.versionGroupDetails});

  factory Move.fromJson(Map<String, dynamic> json) => Move(
        move: json['move'] == null
            ? null
            : Move.fromJson(json['move'] as Map<String, dynamic>),
        versionGroupDetails: (json['version_group_details'] as List<dynamic>?)
            ?.map((e) => VersionGroupDetail.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'move': move?.toJson(),
        'version_group_details':
            versionGroupDetails?.map((e) => e.toJson()).toList(),
      };
}
