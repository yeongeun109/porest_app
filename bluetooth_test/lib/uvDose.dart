import 'package:bluetoothtest/widgets/linechart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class uvDose extends StatefulWidget {
  @override
  _uvDoseState createState() => _uvDoseState();
}

class _uvDoseState extends State<uvDose> {
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
              Expanded(flex: 1, child: Center(child: Text('UV Intensity'))),
            ],
          ),
          backgroundColor: Color(0xFFef7f11),
        ),
        body: Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                      child: Row(
                        children: <Widget>[
                          Text(
                            'UV Band : XXX',
                            style: TextStyle(
                              color: Colors.grey[600],
                              //fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                        ],
                      )),
                  SizedBox(height: 10),
                  Container(
                    width: 400,
                    height: 200,
                    child: SimpleTimeSeriesChart.withSampleData(),
                  ),
                  SizedBox(height: 10),
                  Column(
                    //mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          SizedBox(
                            height: 20,
                            child: RaisedButton(
                              child: Text('UV Power', style: TextStyle(color: Colors.grey[700])),
                              onPressed: (){},
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(7),
                                  side: BorderSide(color: Color(0xFFef7f11), width: 1.2)
                              ),
                              color: Colors.white
                            ),
                          ),
                          SizedBox(width: 100),
                          Text('dfslfkjsdlfk')
                        ],
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        height: 20,
                        child: RaisedButton(
                            child: Text('UV Power', style: TextStyle(color: Colors.grey[700])),
                            onPressed: (){},
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7),
                                side: BorderSide(color: Color(0xFFef7f11), width: 1.2)
                            ),
                            color: Colors.white
                        ),
                      ),
                      SizedBox(height: 10),

                      SizedBox(
                        height: 20,
                        child: RaisedButton(
                            child: Text('UV Power', style: TextStyle(color: Colors.grey[700])),
                            onPressed: (){},
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7),
                                side: BorderSide(color: Color(0xFFef7f11), width: 1.2)
                            ),
                            color: Colors.white
                        ),
                      ),
                    ],
                  )
                ]
            )
        )
    );
  }
}
