import 'package:cloudnapp/model/TreeView_document.dart';
import '../../../widget/getdust.dart';
import 'air/temp.dart';
import 'air/ultrafine_dust.dart';
import 'air/CO.dart';
import 'air/CO2.dart';
import 'air/chemical.dart';
import 'air/fine_dust.dart';
import 'air/humid.dart';
import 'package:flutter/material.dart';

class Plant1 extends StatefulWidget {
  final String directoryName;

  const Plant1({Key key, @required this.directoryName}) : super(key: key);

  @override
  _Plant1State createState() => _Plant1State();
}

class _Plant1State extends State<Plant1> {
  String finedust, ultrafinedust;
  var loading = false;

  OutsideData() async {
    setState(() {
      loading = true;

    });
    List future = await GetOutsideDust();

    print(future);
    setState(() {
      finedust = future[0];
      ultrafinedust = future[1];
      loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    OutsideData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Plant'),
          backgroundColor: Colors.green[900],
        ),
        body: Center(
          child: loading
              ? Center(child: CircularProgressIndicator())
              : ListView(
                  children: <Widget>[
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            width: 100,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.green[300],
                            ),
                            child: Center(
                              child: Text(
                                widget.directoryName,
                                style: TextStyle(
                                    fontSize: 17, color: Colors.white),
                              ),
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 30,
                        ),
                        Container(
                            width: 120,
                            height: 25,
                            decoration: BoxDecoration(
                              color: Colors.lightGreen[600],
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Center(
                              child: Text('외부 환경 데이터',
                                  style: TextStyle(color: Colors.white)),
                            )),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Container(
                                width: 75,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: Colors.brown[400],
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Center(
                                  child: Text('온도',
                                      style: TextStyle(color: Colors.white)),
                                )),
                            SizedBox(height: 10),
                            Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                color: Colors.brown[100],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Container(
                                width: 75,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: Colors.brown[400],
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Center(
                                  child: Text('습도',
                                      style: TextStyle(color: Colors.white)),
                                )),
                            SizedBox(height: 10),
                            Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                color: Colors.brown[100],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Container(
                                width: 75,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: Colors.brown[400],
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Center(
                                  child: Text('미세먼지',
                                      style: TextStyle(color: Colors.white)),
                                )),
                            SizedBox(height: 10),
                            Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                color: Colors.brown[100],
                              ),
                              child: Text(finedust)
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Container(
                                width: 75,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: Colors.brown[400],
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Center(
                                  child: Text('초미세먼지',
                                      style: TextStyle(color: Colors.white)),
                                )),
                            SizedBox(height: 10),
                            Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                color: Colors.brown[100],
                              ),
                              child: Text(ultrafinedust),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 40),
                    Divider(
                      height: 1.0,
                      thickness: 7,
                    ),
                    SizedBox(height: 40),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 30,
                        ),
                        Container(
                            width: 120,
                            height: 25,
                            decoration: BoxDecoration(
                              color: Colors.lightGreen[600],
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Center(
                              child: Text('실내 환경 데이터',
                                  style: TextStyle(color: Colors.white)),
                            )),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Container(
                                width: 75,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: Colors.brown[400],
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Center(
                                  child: Text('온도',
                                      style: TextStyle(color: Colors.white)),
                                )),
                            SizedBox(height: 10),
                            InkWell(
                              child: Container(
                                color: Colors.brown[100],
                                width: 70,
                                height: 70,
                              ),
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Temp(
                                            directoryName: widget.directoryName,
                                          ))),
                            )
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Container(
                                width: 75,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: Colors.brown[400],
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Center(
                                  child: Text('습도',
                                      style: TextStyle(color: Colors.white)),
                                )),
                            SizedBox(height: 10),
                            InkWell(
                              child: Container(
                                color: Colors.brown[100],
                                width: 70,
                                height: 70,
                              ),
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Humidity(
                                            directoryName: widget.directoryName,
                                          ))),
                            )
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Container(
                                width: 75,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: Colors.brown[400],
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Center(
                                  child: Text('미세먼지',
                                      style: TextStyle(color: Colors.white)),
                                )),
                            SizedBox(height: 10),
                            InkWell(
                              child: Container(
                                color: Colors.brown[100],
                                width: 70,
                                height: 70,
                              ),
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FineDust(
                                            directoryName: widget.directoryName,
                                          ))),
                            )
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Container(
                                width: 75,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: Colors.brown[400],
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Center(
                                  child: Text('초미세먼지',
                                      style: TextStyle(color: Colors.white)),
                                )),
                            SizedBox(height: 10),
                            InkWell(
                              child: Container(
                                color: Colors.brown[100],
                                width: 70,
                                height: 70,
                              ),
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => UltrafineDust(
                                            directoryName: widget.directoryName,
                                          ))),
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Container(
                                width: 75,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: Colors.brown[400],
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Center(
                                  child: Text('화학물질',
                                      style: TextStyle(color: Colors.white)),
                                )),
                            SizedBox(height: 10),
                            InkWell(
                              child: Container(
                                color: Colors.brown[100],
                                width: 70,
                                height: 70,
                              ),
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ChemicalSubstance(
                                            directoryName: widget.directoryName,
                                          ))),
                            )
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Container(
                                width: 75,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: Colors.brown[400],
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Center(
                                  child: Text('이산화탄소',
                                      style: TextStyle(color: Colors.white)),
                                )),
                            SizedBox(height: 10),
                            InkWell(
                              child: Container(
                                color: Colors.brown[100],
                                width: 70,
                                height: 70,
                              ),
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CO2(
                                            directoryName: widget.directoryName,
                                          ))),
                            )
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Container(
                                width: 75,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: Colors.brown[400],
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Center(
                                  child: Text('일산화탄소',
                                      style: TextStyle(color: Colors.white)),
                                )),
                            SizedBox(height: 10),
                            InkWell(
                              child: Container(
                                color: Colors.brown[100],
                                width: 70,
                                height: 70,
                              ),
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CO(
                                            directoryName: widget.directoryName,
                                          ))),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
        ));
  }
}
