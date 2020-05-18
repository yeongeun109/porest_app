import 'package:bluetoothtest/uvDose.dart';
import 'package:bluetoothtest/uvIntensity.dart';
import 'package:bluetoothtest/uvcSafe.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_blue/flutter_blue.dart';

import 'uvIndex.dart';

class Navigation extends StatelessWidget {
  final String deviceid;
  final String ServiceData;
  final BluetoothDevice device;
  const Navigation({Key key, @required this.deviceid, @required this.ServiceData, this.device}) : super(key: key);

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
              Expanded(
                  flex: 1, child: Center(child: Text('Smart UV Checker 2'))),
            ],
          ),
          backgroundColor: Color(0xFFef7f11),
        ),
        body: Column(
          children: <Widget>[
            Text('(Device id) $deviceid', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 70),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: 200,
                    child: RaisedButton(
                      child: Text(
                        'UV INTENSITY',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7),
                          side: BorderSide(color: Color(0x335f3206), width: 2)),
                      onPressed: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => uvIntensity(device: device))),
                      color: Color(0xFFef7f11),
                    ),
                  ),
                  SizedBox(height: 30),
                  SizedBox(
                    width: 200,
                    child: RaisedButton(
                      child: Text(
                        'UV DOSE',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7),
                          side: BorderSide(color: Color(0x335f3206), width: 2)),
                      onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => uvDose())),
                      color: Color(0xFFef7f11),
                    ),
                  ),
                  SizedBox(height: 30),
                  SizedBox(
                    width: 200,
                    child: RaisedButton(
                      child: Text(
                        'UV INDEX',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7),
                          side: BorderSide(color: Color(0x335f3206), width: 2)),
                      onPressed: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => uvIndex())),
                      color: Color(0xFFef7f11),
                    ),
                  ),
                  SizedBox(height: 30),
                  SizedBox(
                    width: 200,
                    child: RaisedButton(
                      child: Text(
                        'UVC SAFE',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7),
                          side: BorderSide(color: Color(0x335f3206), width: 2)),
                      onPressed: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => uvcSafe())),
                      color: Color(0xFFef7f11),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
