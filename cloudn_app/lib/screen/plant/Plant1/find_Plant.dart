
import 'dart:convert';

import 'package:cloudnapp/model/APList.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'getpassword_dialog.dart';

class FindPlant extends StatefulWidget {
  @override
  _FindPlantState createState() => _FindPlantState();
}

class _FindPlantState extends State<FindPlant> {
  List<AP> listModel = [];
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
          listModel.add(AP.fromJson(i));
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
    final _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Plant 연결'),
        backgroundColor: Colors.indigo[700],
      ),
      body: SafeArea(
        child: ListView(
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
            /*Container(
              child: loading ? Center(child: CircularProgressIndicator()) : ListView
                  .builder(
                itemCount: listModel.length,
                itemBuilder: (context, i) {
                  final nDataList = listModel[i];
                  return Container(
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => GetPasswordDialog(
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
            ),*/
          ],
        ),
      ),
    );
  }
}
