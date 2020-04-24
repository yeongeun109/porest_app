import 'dart:convert';

class FineDustList {
  String pm10Value;

  FineDustList(this.pm10Value);

  factory FineDustList.fromJson(dynamic json) {
    return FineDustList(json['pm10Value'] as String);
  }

  @override
  String toString() {
    return '${this.pm10Value}';
  }
}

class UltraFineDustList {
  String pm25Value;

  UltraFineDustList(this.pm25Value);

  factory UltraFineDustList.fromJson(dynamic json) {
    return UltraFineDustList(json['pm25Value'] as String);
  }

  @override
  String toString() {
    return '${this.pm25Value}';
  }
}