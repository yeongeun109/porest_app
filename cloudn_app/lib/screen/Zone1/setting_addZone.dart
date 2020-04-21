import 'package:flutter/material.dart';

class SettingAddZone extends StatelessWidget {
  final String directoryName;
  const SettingAddZone({Key key, @required this.directoryName}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: Text('설정 - Zone 기기추가'),
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
                          '선택한 공간을 구성할 수 있습니다.',
                          style: TextStyle(fontSize: 16, color: Colors.white),),
                        Text(
                          'Plant, Tree, Dew를 선택하여 추가, 삭제할 수 있습니다.',
                          style: TextStyle(fontSize: 16, color: Colors.white),),
                      ],
                    )
                )
            ),
            Container(
              //padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(

                children: <Widget>[

                  SizedBox(height: 50,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 200,
                        height: 45,
                        child: Center(child: Text(directoryName, style: TextStyle(fontSize: 16),)),
                        decoration: BoxDecoration(
                          //color: Colors.brown[700],
                          border: Border.all(color: Colors.grey, width: 3),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      SizedBox(width: 10),
                    ],
                  ),
                  SizedBox(height: 50),
                  Row(
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(left:30)),
                      Container(
                        width: 150,
                        height: 30,
                        child: Center(
                            child: Text(
                              '기기 추가',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                        ),
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
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      //Padding(padding: EdgeInsets.only(left:30)),
                      IconButton(
                          icon: Icon(Icons.add_circle_outline, size: 40,)
                      ),
                      Radio(
                        value: 0,
                        groupValue: 0,
                        onChanged: (_) {},
                      ),
                      Text('Plant'),
                      //SizedBox(width: 20,),
                      Radio(
                        value: 0,
                        groupValue: 0,
                        onChanged: (_) {},
                      ),
                      Text('Tree'),
                      //SizedBox(width: 20,),
                      Radio(
                        value: 0,
                        groupValue: 0,
                        onChanged: (_) {},
                      ),
                      Text('Dew'),
                      IconButton(
                          icon: Icon(Icons.remove_circle_outline, size: 40,)
                      ),
                      //Padding(padding: EdgeInsets.only(left:30)),
                    ],
                  ),
                  SizedBox(height: 30),

                  Container(
                      width: 320,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[300], width: 2)
                      ),
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 50,
                            child: Center(child: Text('Plant 1')),
                          ),
                          Divider(height: 1.0, thickness: 2,),
                          Container(
                            height: 50,
                            child: Center(child: Text('Plant 2')),
                          ),
                          Divider(height: 1.0, thickness: 2,),
                          Container(
                            height: 50,
                            child: Center(child: Text('Tree 1')),
                          ),
                        ],

                      )
                  )


                ],
              ),
            ),
          ],
        )
    );
  }
}
