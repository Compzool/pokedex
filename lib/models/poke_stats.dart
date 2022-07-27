class PokeStats {
  String? name;
  String? url;

  PokeStats({this.name, this.url});

  factory PokeStats.fromJson(Map<String, dynamic> json) => PokeStats(
        name: json['name'] as String?,
        url: json['url'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'url': url,
      };
}
