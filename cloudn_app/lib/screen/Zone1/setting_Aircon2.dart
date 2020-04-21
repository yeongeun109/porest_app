import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingAircon2 extends StatefulWidget {
  @override
  _SettingAircon2State createState() => _SettingAircon2State();
}

class _SettingAircon2State extends State<SettingAircon2> {
  final nameController = TextEditingController();
  String icetemp = '24℃';
  String aircon_type = '천정형';
  String aircon_model = '엘지 휘센';
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: Text('설정 - 에어컨2'),
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
                  '선택한 AirConditioner의 상세 설정을 할 수 있습니다.',
                  style: TextStyle(fontSize: 17, color: Colors.white),
                ),
              )),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40.0),
            child: Column(children: <Widget>[
              //Padding()),
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
                          'Air Conditioner2',
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
              SizedBox(height: 20),
              Container(
                child: Row(
                  children: <Widget>[
                    Container(
                        width: 60,
                        child: Row(
                          //crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text('명칭'),
                          ],
                        )),
                    SizedBox(width: 20),
                    Flexible(
                      child: Container(
                        margin: EdgeInsets.only(right: 20),
                        child: TextField(
                          controller: nameController,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Air Conditioner2',
                              hintStyle: TextStyle(color: Colors.grey[400])),
                          cursorColor: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  child: Row(
                    children: <Widget>[
                      Container(
                          width: 60,
                          child: Row(
                            //crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Text('기준온도'),
                            ],
                          )),
                      SizedBox(width: 20),
                      Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Text('냉방'),
                              SizedBox(width: 8),
                              DropdownButton<String>(
                                value: icetemp,
                                icon: Icon(Icons.arrow_downward),
                                iconSize: 24,
                                elevation: 16,
                                style:
                                TextStyle(fontSize: 16, color: Colors.indigo),
                                underline: Container(
                                  height: 2,
                                  color: Colors.indigo,
                                ),
                                onChanged: (String newValue) {
                                  setState(() {
                                    icetemp = newValue;
                                  });
                                },
                                items: <String>[
                                  '18℃',
                                  '19℃',
                                  '20℃',
                                  '21℃',
                                  '22℃',
                                  '23℃',
                                  '24℃',
                                  '25℃',
                                  '26℃',
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(' ' + value + '   '),
                                  );
                                }).toList(),
                              ),
                              SizedBox(width: 20),
                              Text('난방'),
                              SizedBox(width: 8),
                              DropdownButton<String>(
                                value: icetemp,
                                icon: Icon(Icons.arrow_downward),
                                iconSize: 24,
                                elevation: 16,
                                style:
                                TextStyle(fontSize: 16, color: Colors.indigo),
                                underline: Container(
                                  height: 2,
                                  color: Colors.indigo,
                                ),
                                onChanged: (String newValue) {
                                  setState(() {
                                    icetemp = newValue;
                                  });
                                },
                                items: <String>[
                                  '18℃',
                                  '19℃',
                                  '20℃',
                                  '21℃',
                                  '22℃',
                                  '23℃',
                                  '24℃',
                                  '25℃',
                                  '26℃',
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(' ' + value + '   '),
                                  );
                                }).toList(),
                              ),
                            ],
                          ))
                    ],
                  )),
              SizedBox(height: 11),
              Container(
                  child: Row(
                    children: <Widget>[
                      Container(
                          width: 60,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Text('가동시간'),
                            ],
                          )),
                      SizedBox(width: 20),
                      Text('월'),
                      Container(
                          child: Expanded(
                              flex: 1,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  SizedBox(width: 8),
                                  TimeButton(),
                                  Text('~'),
                                  TimeButton(),
                                ],
                              )))
                    ],
                  )),
              //SizedBox(height: 11),
              Container(
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 60,
                      ),
                      SizedBox(width: 20),
                      Text('화'),
                      Container(
                          child: Expanded(
                              flex: 1,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  SizedBox(width: 8),
                                  TimeButton(),
                                  Text('~'),
                                  TimeButton(),
                                ],
                              )))
                    ],
                  )),
              Container(
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 60,
                      ),
                      SizedBox(width: 20),
                      Text('수'),
                      Container(
                          child: Expanded(
                              flex: 1,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  SizedBox(width: 8),
                                  TimeButton(),
                                  Text('~'),
                                  TimeButton(),
                                ],
                              )))
                    ],
                  )),
              Container(
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 60,
                      ),
                      SizedBox(width: 20),
                      Text('목'),
                      Container(
                          child: Expanded(
                              flex: 1,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  SizedBox(width: 8),
                                  TimeButton(),
                                  Text('~'),
                                  TimeButton(),
                                ],
                              )))
                    ],
                  )),
              Container(
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 60,
                      ),
                      SizedBox(width: 20),
                      Text('금'),
                      Container(
                          child: Expanded(
                              flex: 1,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  SizedBox(width: 8),
                                  TimeButton(),
                                  Text('~'),
                                  TimeButton(),
                                ],
                              )))
                    ],
                  )),
              Container(
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 60,
                      ),
                      SizedBox(width: 20),
                      Text('토'),
                      Container(
                          child: Expanded(
                              flex: 1,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  SizedBox(width: 8),
                                  TimeButton(),
                                  Text('~'),
                                  TimeButton(),
                                ],
                              )))
                    ],
                  )),
              Container(
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 60,
                      ),
                      SizedBox(width: 20),
                      Text('일'),
                      Container(
                          child: Expanded(
                              flex: 1,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  SizedBox(width: 8),
                                  TimeButton(),
                                  Text('~'),
                                  TimeButton(),
                                ],
                              )))
                    ],
                  )),
              Container(
                  child: Row(
                    children: <Widget>[
                      Container(
                          width: 60,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Text('타입')
                            ],
                          )
                      ),
                      SizedBox(width: 20),
                      DropdownButton<String>(
                        value: aircon_type,
                        icon: Icon(Icons.arrow_downward),
                        iconSize: 24,
                        elevation: 16,
                        style: TextStyle(fontSize: 16, color: Colors.indigo),
                        underline: Container(
                          height: 2,
                          color: Colors.indigo,
                        ),
                        onChanged: (String newValue) {
                          setState(() {
                            aircon_type = newValue;
                          });
                        },
                        items: <String>[
                          '천정형',
                          '스탠딩형',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),

                    ],
                  )),
              Container(
                  child: Row(
                    children: <Widget>[
                      Container(
                          width: 60,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Text('모델')
                            ],
                          )
                      ),
                      SizedBox(width: 20),
                      DropdownButton<String>(
                        value: aircon_model,
                        icon: Icon(Icons.arrow_downward),
                        iconSize: 24,
                        elevation: 16,
                        style: TextStyle(fontSize: 16, color: Colors.indigo),
                        underline: Container(
                          height: 2,
                          color: Colors.indigo,
                        ),
                        onChanged: (String newValue) {
                          setState(() {
                            aircon_model = newValue;
                          });
                        },
                        items: <String>[
                          '엘지 휘센',
                          '삼성 무풍',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),

                    ],
                  )),
              SizedBox(height: 30),
              RaisedButton(child: Text('저장'),onPressed: () => Navigator.pop(context),),
              SizedBox(
                height: 50,
              ),
            ]),
          ),
        ]));
  }
}

class TimeButton extends StatefulWidget {
  @override
  _TimeButtonState createState() => _TimeButtonState();
}

class _TimeButtonState extends State<TimeButton> {
  String icetemp = '11:00';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DropdownButton<String>(
      value: icetemp,
      icon: Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(fontSize: 16, color: Colors.indigo),
      underline: Container(
        height: 2,
        color: Colors.indigo,
      ),
      onChanged: (String newValue) {
        setState(() {
          icetemp = newValue;
        });
      },
      items: <String>[
        '09:00',
        '10:00',
        '11:00',
        '12:00',
        '13:00',
        '14:00',
        '15:00',
        '16:00',
        '17:00',
        '18:00',
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
