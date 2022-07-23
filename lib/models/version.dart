class Version {
  String? name;
  String? url;

  Version({this.name, this.url});

  factory Version.fromJson(Map<String, dynamic> json) => Version(
        name: json['name'] as String?,
        url: json['url'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'url': url,
      };
}
