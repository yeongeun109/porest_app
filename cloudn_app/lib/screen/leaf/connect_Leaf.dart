import 'package:cloudnapp/model/TreeView_document.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConnectLeaf extends StatelessWidget {
  final String directoryName;
  final List<Document> childData;

  const ConnectLeaf(
      {Key key, @required this.directoryName, @required this.childData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: Text('Leaf 연결'),
          backgroundColor: Colors.indigo[700],
        ),
        body: ListView(children: <Widget>[
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
                    '선택한 Leaf와 Plant의 Bluetooth 연결과',
                    style: TextStyle(fontSize: 17, color: Colors.white),
                  ),
                  Text(
                    'Leaf에 연결된 에어컨을 확인할 수 있습니다.',
                    style: TextStyle(fontSize: 17, color: Colors.white),
                  ),
                ],
              ))),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              children: <Widget>[
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                          width: 120,
                          height: 25,
                          child: Center(
                              child: Text('기기연결상태',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16.3))),
                          decoration: BoxDecoration(
                            color: Colors.grey[500],
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        SizedBox(height: 20),
                        Image.asset(
                          'images/bluetooth_connect.png',
                          height: 70,
                          width: 70,
                        ),
                      ],
                    ),
                    Container(
                      width: 180,
                      padding: EdgeInsets.all(10),
                      child: Center(
                        child: Column(
                          children: <Widget>[
                            Text('Plant와 Bluetooth를'),
                            Text('연결하시려면'),
                            Text('버튼을 누르세요.'),
                            RaisedButton(
                              child: Text('연결하기'),
                              color: Colors.green[200],
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Divider(
                  height: 1.0,
                  thickness: 4,
                ),
                SizedBox(height: 30),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      width: 20
                    ),
                    Container(
                      width: 120,
                      height: 25,
                      child: Center(
                          child: Text('연결된 에어컨',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16.3))),
                      decoration: BoxDecoration(
                        color: Colors.grey[500],
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30,),
                Container(
                    width: 320,
                    height: 55,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[300], width: 2)
                    ),
                    child: Center(child: Text('Zone 1')),
                )
              ],
            ),
          )
        ]
        )
    );
  }
}
