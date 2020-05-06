import 'package:flutter/material.dart';

class FindPlant extends StatelessWidget {
  var loading = false;

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: Text('설정 - Floor'),
          backgroundColor: Colors.indigo[700],
        ),
        body: loading
            ? Center(child: CircularProgressIndicator())
            : ListView(
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
                  Column(
                    children: <Widget>[
                      Divider(height: 1.0, thickness: 2,),
                      Container(
                          height: 40,
                          width: _width,
                          color: Colors.grey[300],
                          child: Row(
                            children: <Widget>[
                              Container(
                                  width: 150,
                                  alignment: Alignment.centerLeft,
                                  //color: Colors.blue,
                                  child: Center(child: Text('ap'))),
                            ],
                          )),
                      Divider(height: 1.0, thickness: 1.5,),
                      WifiList(wifiname: 'plant_001',lock: false,),
                      Divider(height: 1.0, thickness: 1.5,),
                      WifiList(wifiname: 'cloudn_net_2g',lock: true,),
                      Divider(height: 1.0, thickness: 1.5,),
                      WifiList(wifiname: 'Public_wifi_01',lock: false,),
                      Divider(height: 1.0, thickness: 1.5,),
                      WifiList(wifiname: 'Public_wifi_02',lock: false),
                      Divider(height: 1.0, thickness: 1.5,),
                      WifiList(wifiname: 'iptime_2g',lock: false),
                      Divider(height: 1.0, thickness: 2,),
                    ],
                  ),

                ],
              ));
  }
}
class WifiList extends StatefulWidget {
  final String wifiname;
  final bool lock;
  const WifiList({Key key, @required this.wifiname, @required this.lock}) : super(key: key);

  @override
  _WifiListState createState() => _WifiListState();
}

class _WifiListState extends State<WifiList> {
  bool istouched = true;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Container(
          height: 40,
          width: MediaQuery.of(context).size.width,
          child: Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              istouched ? Container(child: Icon(Icons.check)) : Container(),
              Container(
                  width: 120,
                  child: Center(child: Text(widget.wifiname))),
              widget.lock ? Container(
                width: 30,
                child: Icon(Icons.lock),
              ) : Container(),
              Expanded(
                flex: 1,
                child: Container(
                  width: 30,
                  alignment: Alignment.centerRight,
                  child: Icon(Icons.wifi),
                  padding: EdgeInsets.only(right: 30),
                ),
              )
            ],
          )
      ),
    );
  }
}

