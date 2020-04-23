import 'dart:convert';

import 'package:cloudnapp/model/dustmodel.dart';
import 'package:http/http.dart' as http;
import 'package:xml/xml.dart' as xml;
import 'package:xml/xml_events.dart' as xml_events;
//int x =

List arr_tm;
List arr_stationName;
List arr_finedust;
DustList result;
GetDust() {
  GetTm();
}

GetTm() async{
  final responseData = await http.post(
      'http://openapi.airkorea.or.kr/openapi/services/rest/MsrstnInfoInqireSvc/getTMStdrCrdnt?'
          'serviceKey=tQuWrySn7Slv2VuEru%2B%2FzsHhKaW9Cdo82oMxjA2rMSA8osCpN%2FmcfQzoBYySkni%2BmEQniFf%2FlwjlU4JVGm9iMA%3D%3D'
          '&numOfRows=10'
          '&pageNo=1'
          '&umdName=%EA%B0%80%EC%82%B0%EB%8F%99');

  //print(responseData.body);
  final document_tmxy = xml.parse(responseData.body);
  //print(document);
  String tmX = document_tmxy.findAllElements('tmX').single.text;
  //print(tmX);
  String tmY = document_tmxy.findAllElements('tmY').single.text;
  //print(tmY);
  //arr_tm[0] = tmX;
  FindStation(tmX, tmY);
}

FindStation(String x, String y) async{
  final responseData = await http.post(
      'http://openapi.airkorea.or.kr/openapi/services/rest/MsrstnInfoInqireSvc/getNearbyMsrstnList?'
          'serviceKey=tQuWrySn7Slv2VuEru%2B%2FzsHhKaW9Cdo82oMxjA2rMSA8osCpN%2FmcfQzoBYySkni%2BmEQniFf%2FlwjlU4JVGm9iMA%3D%3D'
          '&tmX=$x'
          '&tmY=$y');

  final document_station = xml.parse(responseData.body);
  //print(document_station);
  final tms = document_station.findAllElements('tm');
  arr_tm = tms.map((node) => node.text).toList();
  //print(arr_tm);

  final stationName = document_station.findAllElements('stationName');
  arr_stationName = stationName.map((node) => node.text).toList();

  double min = 100000;
  String resultStation;
  for(int i = 0; i< arr_tm.length; i++){
    if(double.parse(arr_tm[i]) < min){
      min = double.parse(arr_tm[i]);
      resultStation = arr_stationName[i];
    }
  }
  GetDustData(resultStation);
}

GetDustData(String station) async{
  final responseData = await http.post(
      'http://openapi.airkorea.or.kr/openapi/services/rest/ArpltnInforInqireSvc/getMsrstnAcctoRltmMesureDnsty?'
          'stationName=$station'
          '&dataTerm=DAILY'
          '&pageNo=1'
          '&numOfRows=10'
          '&ServiceKey=tQuWrySn7Slv2VuEru%2B%2FzsHhKaW9Cdo82oMxjA2rMSA8osCpN%2FmcfQzoBYySkni%2BmEQniFf%2FlwjlU4JVGm9iMA%3D%3D&ver=1.3&_returnType=json'
  );

  String dustlist = responseData.body;
  var listJson = jsonDecode(dustlist)['list'] as List;
  List dust = listJson.map((listJson) => DustList.fromJson(listJson)).toList();
  print(dust);int i = 0;
  while(true){
    print(dust[i]);
    if(dust[i] != '{-,-}')
    {
      print('+++++++++++++');
      print(dust[i]);
      result = dust[i];
      break;
    }
    i++;
  }
  print(result);
}