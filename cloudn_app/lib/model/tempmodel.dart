import 'dart:convert';

class TempList {
  String body;

  TempList(this.body);

  factory TempList.fromJson(dynamic json) {
    return TempList(json['body'] as String);
  }

  @override
  String toString() {
    return '${this.body}';
  }
}

class HumidList {
  String REH;

  HumidList(this.REH);

  factory HumidList.fromJson(dynamic json) {
    return HumidList(json['pm25Value'] as String);
  }

  @override
  String toString() {
    return '${this.REH}';
  }
}