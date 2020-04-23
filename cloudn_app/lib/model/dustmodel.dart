import 'dart:convert';

class DustList {
  String pm10Value;
  String pm25Value;

  DustList(this.pm10Value, this.pm25Value);

  factory DustList.fromJson(dynamic json) {
    return DustList(json['pm10Value'] as String, json['pm25Value'] as String);
  }

  @override
  String toString() {
    return '{${this.pm10Value},${this.pm25Value}}';
  }
}