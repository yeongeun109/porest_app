import 'package:flutter/material.dart';

class Navigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Smart UV Checker 2'),
          leading:
              Image(image: AssetImage('images/genuv_logo_small_white.png')),
          backgroundColor: Color(0xFFef7f11),
        ),
        body: Center(
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
                onPressed: () {},
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
                onPressed: () {},
                color: Color(0xFFef7f11),
              ),
            ),
            SizedBox(height: 30),
            SizedBox(
              width: 200,
              child: RaisedButton(
                child: Text(
                  'UVC INDEX',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
                    side: BorderSide(color: Color(0x335f3206), width: 2)),
                onPressed: () {},
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
                onPressed: () {},
                color: Color(0xFFef7f11),
              ),
            ),
          ],
        )));
  }
}
