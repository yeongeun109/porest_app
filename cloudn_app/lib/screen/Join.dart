import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_map_location_picker/google_map_location_picker.dart';



class Join extends StatefulWidget {
  @override
  _JoinState createState() => _JoinState();
}

class _JoinState extends State<Join> {
  final join_email = TextEditingController();
  final join_password = TextEditingController();
  final join_password_confirm = TextEditingController();
  final name = TextEditingController();
  final place = TextEditingController();

  LocationResult _pickedLocation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: ListView(
            //mainAxisAlignment: MainAxisAlignment.start,
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 20),
              Text('회원가입', style: TextStyle(fontSize: 20),),
              SizedBox(height: 20),
              Text('이메일', style: TextStyle(fontSize: 16, color: Colors.grey),),
              Row(
                children: <Widget>[
                  Flexible(
                    child: TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(8),
                          border: OutlineInputBorder(),
                        ),
                      controller: join_email,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: IconButton(
                      icon: Icon(Icons.send, size: 30),
                    ),
                  )
                ],
              ),
              SizedBox(height: 15,),
              Text('비밀번호', style: TextStyle(fontSize: 16, color: Colors.grey),),
              TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(8),
                    border: OutlineInputBorder(),
                  ),
                controller: join_password,
              ),
              SizedBox(height: 15,),
              Text('비밀번호 확인', style: TextStyle(fontSize: 16, color: Colors.grey),),
              TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(8),
                    border: OutlineInputBorder(),
                  ),
                controller: join_password_confirm,
              ),
              SizedBox(height: 15,),
              Text('성명', style: TextStyle(fontSize: 16, color: Colors.grey),),
              TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(8),
                    border: OutlineInputBorder(),
                  ),
                controller: name,
              ),
              Row(
                children: <Widget>[
                  Radio(
                    value: 0,
                    groupValue: 0,
                    onChanged: (_) {},
                  ),
                  Text('남'),
                  SizedBox(width: 20,),
                  Radio(
                    value: 1,
                    groupValue: 0,
                    onChanged: (_) {},
                  ),
                  Text('여'),
                ],
              ),
              SizedBox(height: 15,),
              Text('출생년도', style: TextStyle(fontSize: 16, color: Colors.grey),),
              DropdownButton<String>(
                items: <String>['A', 'B', 'C', 'D'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),

                onChanged: (_) {},
              ),
              SizedBox(height: 15,),
              Text('설치장소', style: TextStyle(fontSize: 16, color: Colors.grey),),
              TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(8),
                    border: OutlineInputBorder(),
                  ),
                controller: place,
              ),
              SizedBox(height: 15,),
              Text('위치설정', style: TextStyle(fontSize: 16, color: Colors.grey),),
              Row(
                children: <Widget>[
                  Flexible(
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(8),
                        border: OutlineInputBorder(),
                      )
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: IconButton(
                      icon: Icon(Icons.location_on, size: 30),
                        onPressed: () async {
                          LocationResult result = await showLocationPicker(
                            context,
                            "AIzaSyCsRz7mF4K1lYle6CamNiefCu1UouqhVnQ",
                            myLocationButtonEnabled: true,
                            layersButtonEnabled: true,
                          );
                          print("result = $result");
                          setState(() => _pickedLocation = result);
                        },
                    ),
                  )
                ],
              ),
              SizedBox(height: 15,),
              Center(
                child: RaisedButton(
                  padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                  child: Text('확인'),
                  onPressed: () => Navigator.pop(context),
                ),
              ),

            ],
          )

        )
      )
    );
  }
}
