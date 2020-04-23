import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker/google_maps_place_picker.dart';
import 'package:http/http.dart' as http;

class Join extends StatefulWidget {
  static final kInitialPosition = LatLng(-33.8567844, 151.213108);

  @override
  _JoinState createState() => _JoinState();
}

class _JoinState extends State<Join> {
  final join_email = TextEditingController();
  final join_password = TextEditingController();
  final join_password_confirm = TextEditingController();
  final name = TextEditingController();
  final place = TextEditingController();
  String gender;
  int _currValue = 1;
  String birthYear = '1980';
  String url = 'http://52.79.242.165:8080/api/aos/registerUser';
  double _lat, _lng;
  PickResult selectedPlace;
  List<String> arr;

  @override
  void initState() {
    super.initState();
    _post();
  }


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
                    Text(
                      '회원가입',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(height: 20),
                    Text(
                      '이메일',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
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
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      '비밀번호',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(8),
                        border: OutlineInputBorder(),
                      ),
                      controller: join_password,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      '비밀번호 확인',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(8),
                        border: OutlineInputBorder(),
                      ),
                      controller: join_password_confirm,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      '성명',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
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
                          groupValue: _currValue,
                          onChanged: (int i) {
                            setState(() {
                              _currValue = i;
                              gender = 'M';
                            });
                          },
                        ),
                        Text('남'),
                        SizedBox(
                          width: 20,
                        ),
                        Radio(
                          value: 1,
                          groupValue: _currValue,
                          onChanged: (int i) {
                            setState(() {
                              _currValue = i;
                              gender = 'W';
                            });
                          },
                        ),
                        Text('여'),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      '출생년도',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    DropdownButton<String>(
                      value: birthYear,
                      icon: Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      style: TextStyle(fontSize: 16, color: Colors.indigo),
                      underline: Container(
                        height: 2,
                        color: Colors.indigo,
                      ),
                      onChanged: (String newValue) {
                        setState(() {
                          birthYear = newValue;
                        });
                      },
                      items: <String>['1980', '1981', '1982', '1983']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      '설치장소',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(8),
                        border: OutlineInputBorder(),
                      ),
                      controller: place,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      '위치설정',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    Row(
                      children: <Widget>[
                        arr == null
                            ? Container(
                                width: 150,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                              )
                            : Text(arr[1] + ' ' + arr[2] + ' ' + arr[3] + ' ' + arr[4]),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: IconButton(
                            icon: Icon(Icons.location_on, size: 30),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return PlacePicker(
                                    apiKey:
                                        'AIzaSyCsRz7mF4K1lYle6CamNiefCu1UouqhVnQ',
                                    onPlacePicked: (result) {
                                      selectedPlace = result;
                                      Navigator.of(context).pop();
                                      setState(() {
                                        arr = selectedPlace.formattedAddress.split(' ');
                                        _lat = result.geometry.location.lat;
                                        _lng = result.geometry.location.lng;
                                      });
                                    },
                                    initialPosition: Join.kInitialPosition,
                                    useCurrentLocation: true,
                                    autocompleteLanguage: "ko",
                                  );
                                }),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Center(
                      child: RaisedButton(
                        padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                        child: Text('확인'),
                        onPressed: () async{
                          //print('$_lat' + ' ' + '$_lng');
                          _post();
                          //Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ))));
  }

  void _post() async {
    print('${arr[1] + ' ' + arr[2] + ' ' + arr[3]}');
    final response = await http.post(
        'http://52.79.242.165:8080/api/aos/registerUser',
        body: json.encode({
          'email': 'abcd',
          'password': '${join_password.text}',
          'userType': 'g',
          'userName': '${name.text}',
          'gender': '$gender',
          'birthYear': '$birthYear',
          'buildingName': '${place.text}',
          'location': {
            'address': '${arr[1] + ' ' + arr[2] + ' ' + arr[3]}',
            'longitude': '$_lng',
            'latitude': '$_lat'
          }
        }),
      headers: {'dfadsfa' : 'dsfsf'},);
    print(response.body);
    final Post parsedResponse = Post.fromJSON(jsonDecode(response.body));

  }
}

class Post {
  /*final String email;
  final String password;
  final String userType;
  final String userName;
  final String gender;
  final String birthYear;
  final String buildingName;
  final Object location;
  final String address;
  final String longitude;
  final String latitude;*/
  final int resultCode;
  final String message;

  Post({
    /*this.email,
    this.password,
    this.userType,
    this.userName,
    this.gender,
    this.birthYear,
    this.buildingName,
    this.location,
    this.address,
    this.longitude,
    this.latitude*/
    this.resultCode,
    this.message,
  });

  factory Post.fromJSON(Map<String, dynamic> json) {
    return Post(
      /*email: json['email'],
      password: json['password'],
      userType: json['userType'],
      userName: json['userName'],
      gender: json['gender'],
      birthYear: json['birthYear'],
      buildingName: json['buildingName'],
      location: json['location'],
      address: json['address'],
      longitude: json['longitude'],
      latitude: json['latitude'],*/
      resultCode: json['resultCode'],
      message: json['message']
    );
  }
}