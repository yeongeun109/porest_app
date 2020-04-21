import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LogoutDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        width: double.maxFinite,
        height: 110,
        child: Center(
          child: Column(
            children: <Widget>[
              Text('로그아웃 하시겠습니까?'),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    child: Text('예'),
                    padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                    onPressed: () { Navigator.pop(context);Navigator.pop(context);}
                  ),
                  RaisedButton(
                    child: Text('아니오'),
                    padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                    onPressed: () => Navigator.pop(context),
                  )
                ],
              )
            ],
          ),
        ),
      )
    );
  }
}
