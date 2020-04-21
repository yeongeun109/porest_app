import 'package:cloudnapp/model/TreeView_document.dart';
import 'package:flutter/material.dart';

class SettingTree1 extends StatefulWidget {
  final String directoryName;
  final List<Document> childData;

  const SettingTree1(
      {Key key, @required this.directoryName, @required this.childData})
      : super(key: key);

  @override
  _SettingTree1State createState() => _SettingTree1State();
}

class _SettingTree1State extends State<SettingTree1> {
  String type = '단상';

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: Text('설정 - Tree'),
          backgroundColor: Colors.indigo[700],
        ),
        body: SafeArea(
          child: Column(children: <Widget>[
            Container(
                width: _width,
                height: 65,
                decoration: BoxDecoration(
                  color: Colors.indigo[200],
                ),
                child: Center(
                  child: Text(
                    '해당 Tree와 에어컨의 연결을 설정할 수 있습니다.',
                    style: TextStyle(fontSize: 17, color: Colors.white),
                  ),
                )),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(children: <Widget>[
                //Padding(padding: EdgeInsets.symmetric(horizontal: 20.0)),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 200,
                      height: 45,
                      child: Center(
                          child: Text(
                        widget.directoryName,
                        style: TextStyle(fontSize: 16),
                      )),
                      decoration: BoxDecoration(
                        //color: Colors.brown[700],
                        border: Border.all(color: Colors.grey, width: 3),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    SizedBox(width: 10),
                    Icon(Icons.edit),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  children: <Widget>[
                    Text('type'),
                    SizedBox(width: 30),
                    Text('port'),
                  ],
                ),

              ]),
            ),

          ]),
        ));
  }
}
