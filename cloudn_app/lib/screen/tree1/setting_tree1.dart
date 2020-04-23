import 'package:cloudnapp/model/TreeView_document.dart';
import 'package:flutter/material.dart';

class SettingTree1 extends StatefulWidget {
  final String directoryName;

  const SettingTree1(
      {Key key, @required this.directoryName,}) : super(key: key);

  @override
  _SettingTree1State createState() => _SettingTree1State();
}

class _SettingTree1State extends State<SettingTree1> {
  FocusNode myFocusNode;

  @override
  void initState() {
    super.initState();
    // myFocusNode에 포커스 인스턴스 저장.
    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    // 폼이 삭제되면 myFocusNode도 삭제됨
    myFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text('설정 - Tree'),
          backgroundColor: Colors.indigo[700],
        ),
        body: SafeArea(
          child: ListView(children: <Widget>[
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
              padding: EdgeInsets.symmetric(horizontal: 40.0),
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
                Container(
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 110,
                        child: Text('type'),
                      ),
                      Text('port'),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 80,
                        child: TypeButton(),
                      ),
                      SizedBox(width: 30),
                      SizedBox(width:20, child: Center(child: Text('1'))),
                      Expanded(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.centerRight,
                          child: AirConButton(),
                        )
                      )
                    ],
                  )
                ),
                Container(
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 80,
                        ),
                        SizedBox(width: 30),
                        SizedBox(width:20, child: Center(child: Text('2'))),
                        Expanded(
                            flex: 1,
                            child: Container(
                              alignment: Alignment.centerRight,
                              child: AirConButton(),
                            )
                        )
                      ],
                    )
                ),
                Container(
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 80,
                        ),
                        SizedBox(width: 30),
                        SizedBox(width:20, child: Center(child: Text('3'))),
                        Expanded(
                            flex: 1,
                            child: Container(
                              alignment: Alignment.centerRight,
                              child: AirConButton(),
                            )
                        )
                      ],
                    )
                ),
                SizedBox(height: 20),
                Container(
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 110,
                        child: Text('type'),
                      ),
                      Text('port'),
                    ],
                  ),
                ),
                Container(
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 80,
                          child: TypeButton(),
                        ),
                        SizedBox(width: 30),
                        SizedBox(width:20, child: Center(child: Text('1'))),
                        Expanded(
                            flex: 1,
                            child: Container(
                              alignment: Alignment.centerRight,
                              child: AirConButton(),
                            )
                        )
                      ],
                    )
                ),
                Container(
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 80,
                        ),
                        SizedBox(width: 30),
                        SizedBox(width:20, child: Center(child: Text('2'))),
                        Expanded(
                            flex: 1,
                            child: Container(
                              alignment: Alignment.centerRight,
                              child: AirConButton(),
                            )
                        )
                      ],
                    )
                ),
                Container(
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 80,
                        ),
                        SizedBox(width: 30),
                        SizedBox(width:20, child: Center(child: Text('3'))),
                        Expanded(
                            flex: 1,
                            child: Container(
                              alignment: Alignment.centerRight,
                              child: AirConButton(),
                            )
                        )
                      ],
                    )
                ),
                Padding(padding: EdgeInsets.only(bottom: 20)),
                Row(
                  children: <Widget>[
                    Text('voltage'),
                    SizedBox(width: 20),
                    Container(

                      width: 100,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        //autofocus: true,
                      )
                    ),

                  ],
                ),
                //SizedBox(height: 50),
                Padding(padding: EdgeInsets.only(bottom: 30)),
                RaisedButton(child: Text('완료'), onPressed: () => Navigator.pop(context),),
                Padding(padding: EdgeInsets.only(bottom: 30)),
              ]),
            ),

          ]),
        ));
  }
}
class AirConButton extends StatefulWidget {
  @override
  _AirConButtonState createState() => _AirConButtonState();
}

class _AirConButtonState extends State<AirConButton> {
  String _AirCon = 'Air Cond 1';
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: _AirCon,
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
          _AirCon = newValue;
        });
      },
      items: <String>[
        'Air Cond 1', 'Air Cond 2'
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

class TypeButton extends StatefulWidget {
  @override
  _TypeButtonState createState() => _TypeButtonState();
}

class _TypeButtonState extends State<TypeButton> {
  String _type = '3상';
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: _type,
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
          _type = newValue;
        });
      },
      items: <String>[
        '3상', '단상'
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text('  ' + value + '    '),
        );
      }).toList(),
    );
  }
}
