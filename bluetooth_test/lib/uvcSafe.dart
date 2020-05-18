import 'package:bluetoothtest/widgets/linechart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class uvcSafe extends StatefulWidget {
  @override
  _uvcSafeState createState() => _uvcSafeState();
}

class _uvcSafeState extends State<uvcSafe> {
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
              Expanded(flex: 1, child: Center(child: Text('UVC Safe'))),
            ],
          ),
          backgroundColor: Color(0xFFef7f11),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 10),
            Center(
              child: Text(
                'Maximum Exposition Time / Day',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey[600]
                ),
              ),
            ),
            Text(
              'UVC Wavelength: 254nm',
              textAlign: TextAlign.start,
            )
          ],
        )
    );
  }
}
