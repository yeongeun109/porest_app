import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:tech/models/user.dart';

class GetResult extends StatefulWidget{
  @override
  _GetResultState createState() => _GetResultState();
}

class _GetResultState extends State<GetResult>{
  List<User> listModel = [];
  var loading = false;
  Future<Null> getData() async {
    setState(() {
      loading = true;
    });
    final response = await http.get('http://192.168.4.1/getresult');

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print(data);
      setState(() {
        for (Map i in data) {
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
    return AlertDialog(
      //title: new Text("Alert Dialog title"),
      content: Container(
        width: double.maxFinite,
        height: 50,
        child: loading ? Center(child: CircularProgressIndicator()) : ListView.builder(
          itemCount: listModel.length,
          itemBuilder: (context, i) {
            final nDataList = listModel[i];
            return Container(
              child: Column(
                children: <Widget>[
                  Text(nDataList.title, style: TextStyle(fontSize: 18,),
                  ),
                ],
              )
            );
          },
        ),
      ),
      actions: <Widget>[
        RaisedButton(
            child: (Text('exit')),
            onPressed: (){
              Navigator.pop(context);
              Navigator.pop(context);
              Navigator.pop(context);
            }
        ),
      ],
    );
  }
}