import 'package:cloudnapp/model/TreeView_document.dart';
import 'package:flutter/material.dart';


class ConnectTree1 extends StatelessWidget {
  final String directoryName;
  final List<Document> childData;

  const ConnectTree1(
      {Key key, @required this.directoryName, @required this.childData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: Text('Tree 연결'),
          backgroundColor: Colors.indigo[700],
        ),
        body: ListView(
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
                          '선택한 Tree를 Wifi에 연결하기 위해',
                          style: TextStyle(fontSize: 17, color: Colors.white),
                        ),
                        Text(
                          '아래 설명을 진행해주세요.',
                          style: TextStyle(fontSize: 17, color: Colors.white),
                        ),
                      ],
                    ))),
            Column(
              children: <Widget>[
                //Padding(padding: EdgeInsets.symmetric(horizontal: 20.0)),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 200,
                      height: 45,
                      child: Center(
                          child: Text(
                            directoryName,
                            style: TextStyle(fontSize: 16),
                          )),
                      decoration: BoxDecoration(
                        //color: Colors.brown[700],
                        border: Border.all(color: Colors.grey, width: 3),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 50),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 35.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        '1. Tree의 전원을 연결하고 정면 LED가 주황빛으로 깜빡이는 것을 확인하세요.'
                            '\n\n2. 하단의 "Plant 찾기" 버튼을 누르세요.',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            width: 150,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.indigo[50],
                            ),
                            child: Center(child: Text('Tree 1')),
                          ),
                          RaisedButton(
                            child: Text('Tree 찾기',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            padding: EdgeInsets.fromLTRB(25, 15, 25, 15),
                            color: Colors.indigo[100],
                            onPressed: () {}
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Text('※ 하드웨어 전원 연결 시 Tree 통신모듈의 LED가 주황빛으로 깜빡이다가, '
                          'PORES Tree 찾기 버튼을 누를때 주황빛이 계속 켜져있어야 합니다.'),
                      Text(
                        '\n\n3. Tree 통신모듈의 LED가 주황빛으로 깜빡이는 것을 멈추고 계속 켜져있다면, '
                            '와이파이에 연결할 준비가 된 것입니다.'
                            '\n\n4. 하단의 "네트워크 찾기" 버튼을 누르세요.',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            width: 150,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.indigo[50],
                            ),
                            child: Center(child: Text('cloudn_net_2g')),
                          ),
                          RaisedButton(
                              child: Text('네트워크 찾기',
                                  style:
                                  TextStyle(fontWeight: FontWeight.bold)),
                              padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                              color: Colors.indigo[100],
                              onPressed: () {}
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
