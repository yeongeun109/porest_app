import 'package:cloudnapp/model/TreeView_document.dart';
import 'air/temp.dart';
import 'air/ultrafine_dust.dart';
import 'air/CO.dart';
import 'air/CO2.dart';
import 'air/chemical.dart';
import 'air/fine_dust.dart';
import 'air/humid.dart';
import 'package:flutter/material.dart';

class Plant1 extends StatelessWidget {
  final String directoryName;
  final List<Document> childData;

  const Plant1(
      {Key key, @required this.directoryName, @required this.childData})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Plant'),
        backgroundColor: Colors.green[900],
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            SizedBox(height: 30,),
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
                    child: Text(directoryName, style: TextStyle(fontSize: 17, color: Colors.white),),
                  )
                ),
              ],
            ),
            SizedBox(height: 50,),
            Row(
              children: <Widget>[
                SizedBox(width: 30,),
                Container(
                    width: 120,
                    height: 25,
                    decoration: BoxDecoration(
                      color: Colors.lightGreen[600],
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Center(
                      child: Text('외부 환경 데이터', style: TextStyle(color: Colors.white)),
                    )
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
                          child: Text('온도', style: TextStyle(color: Colors.white)),
                        )
                    ),
                    SizedBox(height:10),
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
                          child: Text('습도', style: TextStyle(color: Colors.white)),
                        )
                    ),
                    SizedBox(height:10),
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
                          child: Text('미세먼지', style: TextStyle(color: Colors.white)),
                        )
                    ),
                    SizedBox(height:10),
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
                          child: Text('초미세먼지', style: TextStyle(color: Colors.white)),
                        )
                    ),
                    SizedBox(height:10),
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        color: Colors.brown[100],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 40),
            Divider(height: 1.0, thickness: 7,),
            SizedBox(height: 40),
            Row(
              children: <Widget>[
                SizedBox(width: 30,),
                Container(
                    width: 120,
                    height: 25,
                    decoration: BoxDecoration(
                      color: Colors.lightGreen[600],
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Center(
                      child: Text('실내 환경 데이터', style: TextStyle(color: Colors.white)),
                    )
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
                          child: Text('온도', style: TextStyle(color: Colors.white)),
                        )
                    ),
                    SizedBox(height:10),
                    InkWell(
                      child: Container(
                        color: Colors.brown[100],
                        width : 70,
                        height: 70,
                      ),
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Temp(directoryName: directoryName,))),
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
                          child: Text('습도', style: TextStyle(color: Colors.white)),
                        )
                    ),
                    SizedBox(height:10),
                    InkWell(
                      child: Container(
                        color: Colors.brown[100],
                        width : 70,
                        height: 70,
                      ),
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Humidity(directoryName: directoryName,))),
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
                          child: Text('미세먼지', style: TextStyle(color: Colors.white)),
                        )
                    ),
                    SizedBox(height:10),
                    InkWell(
                      child: Container(
                        color: Colors.brown[100],
                        width : 70,
                        height: 70,
                      ),
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => FineDust(directoryName: directoryName,))),
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
                          child: Text('초미세먼지', style: TextStyle(color: Colors.white)),
                        )
                    ),
                    SizedBox(height:10),
                    InkWell(
                      child: Container(
                        color: Colors.brown[100],
                        width : 70,
                        height: 70,
                      ),
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => UltrafineDust(directoryName: directoryName,))),
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
                          child: Text('화학물질', style: TextStyle(color: Colors.white)),
                        )
                    ),
                    SizedBox(height:10),
                    InkWell(
                      child: Container(
                        color: Colors.brown[100],
                        width : 70,
                        height: 70,
                      ),
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ChemicalSubstance(directoryName: directoryName,))),
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
                          child: Text('이산화탄소', style: TextStyle(color: Colors.white)),
                        )
                    ),
                    SizedBox(height:10),
                    InkWell(
                      child: Container(
                        color: Colors.brown[100],
                        width : 70,
                        height: 70,
                      ),
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => CO2(directoryName: directoryName,))),
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
                          child: Text('일산화탄소', style: TextStyle(color: Colors.white)),
                        )
                    ),
                    SizedBox(height:10),
                    InkWell(
                      child: Container(
                        color: Colors.brown[100],
                        width : 70,
                        height: 70,
                      ),
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => CO(directoryName: directoryName,))),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      )
    );
  }
}
