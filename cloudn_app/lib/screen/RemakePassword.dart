import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RemakePassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        content: Container(
          width: double.maxFinite,
          height: 170,
          child: Center(
            child: Column(
              children: <Widget>[
                Text('비밀번호를 재설정할 수 있는 링크를\n입력하신 이메일로 보내드립니다.\n재설정 하시겠습니까?'),
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RaisedButton(
                      child: Text('취소'),
                      padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                      onPressed: () => Navigator.pop(context),
                    ),
                    RaisedButton(
                      child: Text('재설정'),
                      padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                      onPressed: () => Navigator.pop(context),
                      color: Colors.blue,
                    ),
                  ],
                )
              ],
            ),
          ),
        )
    );
  }
}
