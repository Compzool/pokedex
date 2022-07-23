class TypeCategory {
  String? name;
  String? url;

  TypeCategory({this.name, this.url});

  factory TypeCategory.fromJson(Map<String, dynamic> json) => TypeCategory(
        name: json['name'] as String?,
        url: json['url'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'url': url,
      };
}
