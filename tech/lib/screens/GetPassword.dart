import 'dart:io';
import 'package:tech/screens/GetResult.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

String networkStatus = 'null';
String wifiName = 'null';

class GetPassword extends StatefulWidget {
  String dName;
  GetPassword({this.dName});

  @override
  _GetPasswordState createState() => _GetPasswordState();
}

class _GetPasswordState extends State<GetPassword> {

  final _pw = TextEditingController();
  @override
  void dispose() {
    _pw.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.dName}의 암호 입력',
            style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(16),
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Column(
                        children: <Widget>[
                          TextField(
                            controller: _pw,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                          ),
                          RaisedButton(
                            child:(Text("연결")),
                            onPressed: () {
                              _post(_pw.text);
                            },
                            color: Colors.white,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String postState = 'null';
  void _post(value) async{
    var response = await http.post('http://192.168.4.1/connect?ssid=${widget.dName}&pw=$value');

    print('응답 상태: ${response.statusCode}');
    if(response.statusCode == 200){
      setState(() {
        postState = 'postokay';
      });
    }

    ConnectivityResult connectResult;
    int sec = 0;

    while (sec <= 10000) {
      sleep(const Duration(milliseconds: 1));
      sec++;
      connectResult = await Connectivity().checkConnectivity();
      if (connectResult == ConnectivityResult.none) {
        while(true) {
          sleep(const Duration(milliseconds: 1));
          sec++;
          connectResult = await Connectivity().checkConnectivity();
          wifiName = (await Connectivity().getWifiName()).toString();
          if (connectResult == ConnectivityResult.wifi && wifiName == 'ESP32') {
            Navigator.push(context, MaterialPageRoute(builder: (context) => GetResult()));
            print('네트워크 연결 완료');
            break;
          }
        }
        break;
      }
    }
  }

}