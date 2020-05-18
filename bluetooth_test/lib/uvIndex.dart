import 'package:bluetoothtest/widgets/linechart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class uvIndex extends StatefulWidget {
  @override
  _uvIndexState createState() => _uvIndexState();
}

class _uvIndexState extends State<uvIndex> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image(
                image: AssetImage('images/genuv_logo_small_white.png'),
                width: 100,
              ),
              SizedBox(width: 30),
              Expanded(flex: 1, child: Center(child: Text('UV Index'))),
            ],
          ),
          backgroundColor: Color(0xFFef7f11),
        ),
        body: Column(
          children: <Widget>[
            SizedBox(height: 10),
            Stack(
              children: <Widget>[
                Image(
                  image: AssetImage('images/uv_index_graph.png'),
                ),
                Positioned(
                  left: 86,
                  bottom: 0.0,
                  child: Image(
                    image: AssetImage('images/uv_index_pin.png'),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              '0 UVI',
              style: TextStyle(
                fontSize: 25,
                color: Colors.grey[600]
              ),
            ),
            Text(
              'LOW',
              style: TextStyle(
                  fontSize: 25,
                  color: Color(0xFF77AE38)
              ),
            ),
            SizedBox(height: 40),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: <Widget>[
                  Text(
                    'Minimal sun protection required (unless near water or snow). '
                        'Wear sunglasses if bright.',
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 15,
                      color: Colors.grey[600]
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30),
                  Container(
                    height: 60,
                    //padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFef7f11)),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.grey[300]
                    ),
                    child: Image.asset('images/uv_index_low.png', fit: BoxFit.fitHeight)
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  child: Text(
                    'START',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7),
                      side: BorderSide(color: Color(0x335f3206), width: 2)),
                  onPressed: () {
                  },
                  color: Color(0xFFef7f11),
                ),
                RaisedButton(
                  child: Icon(
                    Icons.camera_alt,
                    color: Colors.white,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7),
                      side: BorderSide(color: Color(0x335f3206), width: 2)),
                  onPressed: () {},
                  color: Color(0xFFef7f11),
                ),
                RaisedButton(
                  child: Icon(
                    Icons.save,
                    color: Colors.white,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7),
                      side: BorderSide(color: Color(0x335f3206), width: 2)),
                  onPressed: () {},
                  color: Color(0xFFef7f11),
                )
              ],
            )
          ],
        )
    );
  }
}
