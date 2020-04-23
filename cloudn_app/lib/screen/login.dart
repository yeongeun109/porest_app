import 'package:cloudnapp/Screen/Join.dart';
import 'package:cloudnapp/Screen/RemakePassword.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'MainPage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        //child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            SizedBox(height: 80,),
            Column(
              children: <Widget>[
                SizedBox(
                  child: Container(
                    color: Colors.lightGreen,
                    child: Text('Logo'),
                  ),
                  width: 100,
                  height: 100,
                ),
                SizedBox(
                  height: 10,
                ),
                Text('Logo Name'),
                SizedBox(height: 120,),
                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    filled: true,
                    labelText: 'ID',
                  ),
                ),
                SizedBox(height: 12,),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    filled: true,
                    labelText: 'Password',
                  ),
                  obscureText: true,
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      Checkbox(
                        value: true,
                        onChanged: (bool value){},
                      ),
                      Text('자동로그인'),
                    ],
                  )
                ),
                RaisedButton(
                  padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                  child: Text('로그인'),
                  onPressed: () {
                    //http.post('http://192.168.4.1/connect?id=$_usernameController&pw=$_passwordController');
                    //_loginpost(_usernameController, _passwordController);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MainPage()));
                  },
                ),
                ButtonBar(children: <Widget>[
                  FlatButton(
                    child: Text('비밀번호 재설정'), 
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => RemakePassword())),
                  ),
                  FlatButton(
                    child: Text('회원가입'),
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Join())),
                  ),
                ],),
              ],
            ),
          ],
        )
    );
  }
  void _loginpost(id, pw) {
    http.post('http://192.168.4.1/connect?id=$id&pw=$pw');
  }
}
