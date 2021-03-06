import 'package:cloudnapp/screen/Logout_dialog.dart';
import 'package:cloudnapp/widget/getdust.dart';
import 'package:cloudnapp/widget/TreeView.dart';
import 'package:cloudnapp/widget/changelaluMap.dart';
import 'package:cloudnapp/widget/gettemphumid.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_maps_place_picker/google_maps_place_picker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MainPage extends StatefulWidget {
  static final kInitialPosition = LatLng(-33.8567844, 151.213108);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PickResult selectedPlace;
  List<String> arr;
  double _lat, _lng;
  Map_xy changeresult;
  String time;
  int nx = 56, ny = 128;
  String finedust, ultrafinedust, temp, humid;
  var loading = false;

  OutsideData() async {
    setState(() {
      loading = true;
    });
    List dust = await GetOutsideDust();
    List temphumid = await GetTempHumid(nx, ny);
    print(temphumid);
    print(dust);
    setState(() {
      temp = temphumid[0];
      humid = temphumid[1];
      finedust = dust[0];
      ultrafinedust = dust[1];

      loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    OutsideData();
  }

  @override
  Widget build(BuildContext context) {
    final height2 = MediaQuery.of(context).size.height - 350;
    return Scaffold(
        body: Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: loading
          ? Center(child: CircularProgressIndicator())
          : ListView(
              children: <Widget>[
                SizedBox(
                  height: 40,
                ),
                Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            backgroundImage:
                                AssetImage('images/user_login.png'),
                            radius: 30,
                          ),
                          Container(
                            //width: 100,
                            child: Column(
                              children: <Widget>[
                                Text(
                                  '홍길동',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                FlatButton(
                                  child: Text(
                                    '로그아웃',
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                  onPressed: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              LogoutDialog())),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    //SizedBox(width: 60,),
                    Container(
                        child: Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          arr == null
                              ? Container()
                              : (arr[1] == '서울특별시'
                                  ? Text(arr[1] + '\n' + arr[2] + ' ' + arr[3])
                                  : Text(
                                      arr[2] + '\n' + arr[3] + ' ' + arr[4])),
                          Container(
                            //alignment: Alignment(1.0, 0.0),
                            child: IconButton(
                              icon: Icon(Icons.location_on),
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
                                        arr = selectedPlace.formattedAddress
                                            .split(' ');
                                        _lat = result.geometry.location.lat;
                                        _lng = result.geometry.location.lng;
                                        changeresult =
                                            changelaluMap(_lng, _lat);
                                        //print('${changeresult.x}' + ' ' + '${changeresult.y}');
                                        //setState(() {
                                        nx = changeresult.x;
                                        ny = changeresult.y;
                                        //});
                                      },
                                      initialPosition:
                                          MainPage.kInitialPosition,
                                      useCurrentLocation: true,
                                      autocompleteLanguage: "ko",
                                    );
                                  }),
                                );
                              },
                              iconSize: 50,
                            ),
                          )
                        ],
                      ),
                    )),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                            width: 75,
                            height: 20,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Center(
                              child: Text('온도',
                                  style: TextStyle(color: Colors.white)),
                            )),
                        SizedBox(height: 10),
                        Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            color: Colors.indigo[100],
                          ),
                          child: Center(
                              child: Text(temp,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[700]))),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                            width: 75,
                            height: 20,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Center(
                              child: Text('습도',
                                  style: TextStyle(color: Colors.white)),
                            )),
                        SizedBox(height: 10),
                        Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            color: Colors.indigo[100],
                          ),
                          child: Center(
                              child: Text(humid,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[700]))),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                            width: 75,
                            height: 20,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Center(
                              child: Text('미세먼지',
                                  style: TextStyle(color: Colors.white)),
                            )),
                        SizedBox(height: 10),
                        Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              color: Colors.indigo[100],
                            ),
                            child: Center(
                                child: Text(finedust,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey[700])))),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                            width: 75,
                            height: 20,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Center(
                              child: Text('초미세먼지',
                                  style: TextStyle(color: Colors.white)),
                            )),
                        SizedBox(height: 10),
                        Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              color: Colors.indigo[100],
                            ),
                            child: Center(
                                child: Text(ultrafinedust,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey[700])))),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                        width: 110,
                        height: 20,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Center(
                          child: Text('기기등록현황',
                              style: TextStyle(color: Colors.white)),
                        )),
                    IconButton(
                      icon: Icon(Icons.refresh),
                      iconSize: 35,
                      onPressed: () {},
                    )
                  ],
                ),
                Container(
                  width: 400,
                  height: height2,
                  child: MyApp(),
                )
              ],
            ),
    ));
  }
}
