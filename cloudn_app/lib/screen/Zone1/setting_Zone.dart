import 'package:cloudnapp/screen/Zone1/setting_Aircon1.dart';
import 'package:cloudnapp/screen/Zone1/setting_Aircon2.dart';
import 'package:flutter/material.dart';

class SettingZone extends StatefulWidget {
  final String directoryName;

  const SettingZone({Key key, @required this.directoryName}) : super(key: key);

  @override
  _SettingZoneState createState() => _SettingZoneState();
}

class _SettingZoneState extends State<SettingZone> {
  final _widthController = TextEditingController();
  final _lengthController = TextEditingController();
  final _heightController = TextEditingController();
  var calresult = '';

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: Text('설정 - Zone'),
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
                  child: Text(
                    '선택한 Zone의 상세 설정과 에어컨 배치를 \n추가할 수 있습니다.',
                    style: TextStyle(fontSize: 17, color: Colors.white),
                  ),
                )),
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
                Row(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(left: 30)),
                    Container(
                      width: 150,
                      height: 30,
                      child: Center(
                          child: Text(
                            '공간체적설정',
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
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Padding(padding: EdgeInsets.symmetric(horizontal: 10.0),),
                    Column(
                      children: <Widget>[
                        Text('가로'),
                        Container(
                          width: 65,
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: TextField(
                              keyboardType: TextInputType.number,
                              controller: _widthController,
                              decoration: InputDecoration(
                                filled: true,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text('X'),
                    Column(
                      children: <Widget>[
                        Text('세로'),
                        Container(
                          width: 65,
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: TextField(
                              keyboardType: TextInputType.number,
                              controller: _lengthController,
                              decoration: InputDecoration(
                                filled: true,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text('X'),
                    Column(
                      children: <Widget>[
                        Text('높이'),
                        Container(
                          width: 65,
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: TextField(
                              keyboardType: TextInputType.number,
                              controller: _heightController,
                              decoration: InputDecoration(
                                filled: true,
                              ),
                              onEditingComplete: _placeCalc,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text('='),
                    Column(
                      children: <Widget>[
                        Text('체적'),
                        Container(
                          width: 65,
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(calresult),
                          ),
                        ),
                      ],
                    ),
                    Padding(padding: EdgeInsets.symmetric(horizontal: 10.0),),
                  ],
                ),
                SizedBox(height: 20),
                Divider(
                  height: 1.0,
                  thickness: 4,
                ),
                SizedBox(height: 20),
                Row(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(left: 30)),
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
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    IconButton(
                        icon: Icon(
                      Icons.add_circle_outline,
                      size: 40,
                    ),
                    onPressed: (){},),
                    IconButton(
                        icon: Icon(
                      Icons.remove_circle_outline,
                      size: 40,
                    ),
                    onPressed: (){},),
                  ],
                ),
                SizedBox(height: 15),

                Container(
                    width: 320,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[300], width: 2)),
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Center(child: Text('Air Conditioner 1')),
                              IconButton(icon: Icon(Icons.settings),
                                onPressed: () =>
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) =>
                                            SettingAircon1())),)
                            ],
                          ),
                        ),
                        Divider(
                          height: 1.0,
                          thickness: 2,
                        ),
                        Container(
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Center(child: Text('Air Conditioner 2')),
                              IconButton(icon: Icon(Icons.settings),
                                onPressed: () =>
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) =>
                                            SettingAircon2())),
                              )
                            ],
                          ),
                        ),
                      ],
                    ))
              ],
            ),
          ],
        ));
  }
  void _placeCalc(){
    if(_heightController.text.length == 0)
      return;
    if(_widthController.text.length == 0)
      return;
    if(_lengthController.text.length == 0)
      return;

    setState(() {
      int height = int.parse(_heightController.text);
      int width = int.parse(_widthController.text);
      int length = int.parse(_lengthController.text);

      var result = height * width * length;
      calresult = result.toString();
    });
  }
}

