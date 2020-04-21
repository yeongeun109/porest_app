import 'dart:convert';

//import 'package:tech/models/user.dart';
//import 'package:tech/screens/GetPassword.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class FindPlant extends StatefulWidget {
  @override
  _FindPlantState createState() => _FindPlantState();
}

class _FindPlantState extends State<FindPlant> {
  /*List<User> listModel = [];
  var loading = false;

  Future<Null> getData() async{
    setState(() {
      loading = true;
    });

    final responseData = await http.get("http://172.24.1.1/WifiScan");
    if(responseData.statusCode == 200){
      final data = jsonDecode(responseData.body);
      setState(() {
        for(Map i in data){
          listModel.add(User.fromJson(i));
        }
        loading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }*/

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Plant 연결'),
        backgroundColor: Colors.indigo[700],
      ),
      body: Column(
        children: <Widget>[
          Container(
              width: _width,
              height: 65,
              decoration: BoxDecoration(
                color: Colors.indigo[200],
              ),
              child: Center(
                child: Text(
                  'AP 리스트 중에서 연결할 Plant를 선택해 주세요.',
                  style: TextStyle(fontSize: 17, color: Colors.white),
                ),
              )),
        ],
      ),
    );
  }
}
