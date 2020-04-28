import 'dart:convert';

import 'package:cloudnapp/model/temphumidmodel.dart';
import 'package:http/http.dart' as http;

List<String> arr_date;
String date, time;

var now = DateTime.now();
List<String> arr = now.toString().split(' ');
var resultarr = [];
String result_temp, result_humid;


GetTempHumid(int x, int y) async{
  arr_date = arr[0].split('-');
  date = arr_date[0] + arr_date[1] + arr_date[2];
  if((int.parse(arr[1].substring(0,2)) - 1) / 10 < 1){
    time = '0' + (int.parse(arr[1].substring(0,2)) - 1).toString() +'00';
  }
  else{
    time = (int.parse(arr[1].substring(0,2)) - 1).toString() +'00';
  }

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
  //print(responseData.body);

  var templist = jsonDecode(responseData.body);

  //print(templist);
  String a = templist.toString();
  //print(a);
  String target_temp = 'category: T1H';
  String target_humid = 'category: REH';
  int target_num = a.indexOf(target_temp);



  result_temp = a.substring(target_num + 43, target_num + 47);
  print('온도: ' + result_temp);
  //print(a);

  int target2_num = a.indexOf(target_humid);
  result_humid = a.substring(target2_num + 43, target2_num + 45);

  print('습도: ' + result_humid);

  resultarr = [result_temp, result_humid];
  return resultarr;
}


