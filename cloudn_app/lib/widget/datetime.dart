import 'dart:convert';

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
  int lng = x, lat = y;
  print(date + ' ' + time + ' ' + '$lng' + ' ' +'$lat');
  final responseData = await http.post('http://apis.data.go.kr/1360000/VilageFcstInfoService/getUltraSrtNcst?ServiceKey=tQuWrySn7Slv2VuEru%2B%2FzsHhKaW9Cdo82oMxjA2rMSA8osCpN%2FmcfQzoBYySkni%2BmEQniFf%2FlwjlU4JVGm9iMA%3D%3D&base_date=20200423&base_time=1200&nx=59&ny=126&dataType=json');
  print(responseData.body);
  //final Post parsedResponse = Post.fromJSON(jsonDecode(responseData.body));
  //var json = responseData.body, object = jsonDecode(json), ;
  //print(result_date);
  //return resultarr;
}


class Post {
  final int userId;
  final int id;
  final String title;

  Post({
    this.userId,
    this.id,
    this.title,
  });

  factory Post.fromJSON(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      userId: json['userId'],
      title: json['title'],
    );
  }
}
/*
'http://apis.data.go.kr/1360000/VilageFcstInfoService/getUltraSrtNcst?'
'ServiceKey=tQuWrySn7Slv2VuEru%2B%2FzsHhKaW9Cdo82oMxjA2rMSA8osCpN%2FmcfQzoBYySkni%2BmEQniFf%2FlwjlU4JVGm9iMA%3D%3D'
'&base_date=$date'
'&base_time=$time'
'&nx=$lng'
'&ny=$lat'
'&dataType=json'*/