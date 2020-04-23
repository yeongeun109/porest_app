import 'dart:convert';

List<AP> modelUserFromJson(String str) =>
    List<AP>.from(json.decode(str).map((x) => AP.fromJson(x)));

String modelUserToJson(List<AP> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AP {
  String title;

  AP({
    this.title,
  });

  factory AP.fromJson(Map<String, dynamic> json) => AP(
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
      };
}
