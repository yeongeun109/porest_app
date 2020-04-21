import 'dart:convert';
import 'package:tech/models/user.dart';
import 'package:tech/screens/GetPassword.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';


class WifiList extends StatefulWidget {
  @override
  _WifiListState createState() => _WifiListState();
}

class _WifiListState extends State<WifiList> {
  List<User> listModel = [];
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
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wi-Fi', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),

      body: Container(
        child: loading ? Center(child: CircularProgressIndicator()) : ListView
            .builder(
          itemCount: listModel.length,
          itemBuilder: (context, i) {
            final nDataList = listModel[i];
            return Container(
              child: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => GetPassword(
                      dName: nDataList.title,
                    )));
                  },
                child: Card(
                  //color: Colors.lightBlue[50],
                  margin: EdgeInsets.all(0.3),
                  child: Padding(
                    padding: EdgeInsets.only(left: 40, top: 17, bottom: 17),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(nDataList.title, style: TextStyle(
                            fontSize: 18,
                            ),
                        ),
                      ],
                    ),
                  ),
                ),
            ),);
          },
        ),
      ),
    );
  }
}