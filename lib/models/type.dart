import 'type_category.dart';

class Type {
  int? slot;
  TypeCategory? typeCategory;

  Type({this.slot, this.typeCategory});

  factory Type.fromJson(Map<String, dynamic> json) => Type(
        slot: json['slot'] as int?,
        typeCategory: json['type'] == null
            ? null
            : TypeCategory.fromJson(
                json['type'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'slot': slot,
        'type_category': typeCategory?.toJson(),
      };
}
