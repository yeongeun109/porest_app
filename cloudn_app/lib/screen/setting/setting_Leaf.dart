import 'package:cloudnapp/screen/testscreen.dart';
import 'package:flutter/material.dart';

class SettingLeaf extends StatefulWidget {
  final String directoryName;

  const SettingLeaf({Key key, @required this.directoryName}) : super(key: key);

  @override
  _SettingLeafState createState() => _SettingLeafState();
}

class _SettingLeafState extends State<SettingLeaf> {
  @override
  Widget build(BuildContext context) {
    bool isSwitched = false;
    final _width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: Text('설정 - ${widget.directoryName}'),
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
                    child: Column(
                      children: <Widget>[
                        Text(
                          '관리할 건물의 Floor를 추가할 수 있습니다.',
                          style: TextStyle(fontSize: 17, color: Colors.white),
                        ),
                        Text(
                          '추가, 삭제 버튼을 이용하세요.',
                          style: TextStyle(fontSize: 17, color: Colors.white),
                        ),
                      ],
                    ))),
            Column(
              children: <Widget>[
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
                SizedBox(height: 50),
                Container(
                  child: Row(
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(left: 40)),
                      Container(
                        width: 150,
                        height: 30,
                        child: Center(
                            child: Text(
                          '에어컨 추가',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                        decoration: BoxDecoration(
                          color: Colors.grey[700],
                          //border: Border.all(color: Colors.grey, width: 3),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Container(
                      //width: 320,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[300], width: 2)),
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 50,
                            padding: EdgeInsets.only(left: 20, right: 20),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Air Conditioner 1',
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                                ),
                                Switch(
                                  value: isSwitched,
                                  onChanged: (value){
                                    setState(() {
                                      isSwitched = value;
                                    });
                                  },
                                  activeTrackColor: Colors.lightGreenAccent,
                                  activeColor: Colors.green,
                                )
                              ],
                            ),
                          ),
                          Divider(
                            height: 1.0,
                            thickness: 2,
                          ),
                          Container(
                            height: 50,
                            padding: EdgeInsets.only(left: 20, right: 20),
                            alignment: Alignment.centerLeft,
                            child: Text('Air Conditioner 2', style: TextStyle(fontSize: 17)),
                          ),
                        ],
                      )),
                )
              ],
            ),
          ],
        ));
  }
}
