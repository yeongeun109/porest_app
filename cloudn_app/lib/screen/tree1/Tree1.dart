import 'package:cloudnapp/model/TreeView_document.dart';
import 'package:cloudnapp/widget/chart/linechart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Tree1 extends StatefulWidget {
  final String directoryName;
  const Tree1({Key key, @required this.directoryName})
      : super(key: key);

  @override
  _Tree1State createState() => _Tree1State();
}

class _Tree1State extends State<Tree1> {
  @override
  Widget build(BuildContext context) {
    String floorValue = '11F';
    String plantValue = 'AirCon1';
    final _width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: Text('Tree 모니터링'),
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
                child: Text(
                  '선택한 Tree의 데이터를 확인할 수 있습니다.',
                  style: TextStyle(fontSize: 17, color: Colors.white),
                ),
              )),
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
                            widget.directoryName,
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
                SizedBox(height: 30),
                Row(
                  children: <Widget>[
                    Text('Target',style: TextStyle(fontSize: 16),),
                    SizedBox(width: 25),
                    DropdownButton<String>(
                      value: floorValue,
                      icon: Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.indigo
                      ),
                      underline: Container(
                        height: 2,
                        color: Colors.indigo,
                      ),
                      onChanged: (String newValue) {
                        setState(() {
                          floorValue = newValue;
                        });
                      },
                      items: <String>['11F', '12F',]
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    SizedBox(width: 20),
                    DropdownButton<String>(
                      value: plantValue,
                      icon: Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.indigo
                      ),
                      underline: Container(
                        height: 2,
                        color: Colors.indigo,
                      ),
                      onChanged: (String newValue) {
                        setState(() {
                          plantValue = newValue;
                        });
                      },
                      items: <String>['AirCon1', 'AirCon2',]
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Period',style: TextStyle(fontSize: 16),),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[

                    //SizedBox(width: 10,),
                    Radio(
                      value: 0,
                      groupValue: 0,
                      onChanged: (_) {},
                    ),
                    Text('1일', style: TextStyle(fontSize: 13),),
                    //SizedBox(width: 10,),
                    Radio(
                      value: 0,
                      groupValue: 0,
                      onChanged: (_) {},
                    ),
                    Text('7일'),
                    //SizedBox(width: 10,),
                    Radio(
                      value: 0,
                      groupValue: 0,
                      onChanged: (_) {},
                    ),
                    Text('30일'),
                    SizedBox(width: 10,),
                    SizedBox(
                      width: 50,
                      child: RaisedButton(
                        padding: EdgeInsets.all(0),
                        child: Text('조회'),
                        onPressed: (){},
                        color: Colors.orange[200],
                      ),
                    )
                  ],
                ),
                SizedBox(height: 40),
                Container(
                  width: 400,
                  height: 300,
                  child: SimpleTimeSeriesChart.withSampleData(),
                )
              ],
            ),
          ),
        ]));
  }
}
