import 'dart:convert';

import 'package:cloudnapp/model/temphumidmodel.dart';
import 'package:http/http.dart' as http;

List<String> arr_date;
String date, time;
List resultarr;
var now = DateTime.now();
List<String> arr = now.toString().split(' ');

GetDate(int x, int y) async{
  arr_date = arr[0].split('-');
  date = arr_date[0] + arr_date[1] + arr_date[2];
  time = (int.parse(arr[1].substring(0,2)) - 1).toString() +'00';
  int nx = x, ny = y;
  print(date + ' ' + time + ' ' + '$nx' + ' ' +'$ny');

  final responseData =
  await http.get('http://apis.data.go.kr/1360000/VilageFcstInfoService/getUltraSrtNcst?'
      'ServiceKey=tQuWrySn7Slv2VuEru%2B%2FzsHhKaW9Cdo82oMxjA2rMSA8osCpN%2FmcfQzoBYySkni%2BmEQniFf%2FlwjlU4JVGm9iMA%3D%3D'
      '&base_date=$date'
      '&base_time=$time'
      '&nx=$nx'
      '&ny=$ny'
      '&dataType=json');
  print(responseData.body);

  String templist = responseData.body;

  HumidList templistresult = HumidList.fromJson(jsonDecode(templist));

  print(templistresult);



  //print(result_finedust);
}


/*
'http://apis.data.go.kr/1360000/VilageFcstInfoService/getUltraSrtNcst?'
'ServiceKey=tQuWrySn7Slv2VuEru%2B%2FzsHhKaW9Cdo82oMxjA2rMSA8osCpN%2FmcfQzoBYySkni%2BmEQniFf%2FlwjlU4JVGm9iMA%3D%3D'
'&base_date=$date'
'&base_time=$time'
'&nx=$lng'
'&ny=$lat'
'&dataType=json'*/