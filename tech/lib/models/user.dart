import 'dart:convert';

List<User> modelUserFromJson(String str) => List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String modelUserToJson(List<User> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  String title;
  User({
    this.title,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
  };
}
