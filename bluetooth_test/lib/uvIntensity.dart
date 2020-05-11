import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class uvIntensity extends StatefulWidget {
  final String ServiceData;
  const uvIntensity({Key key,@required this.ServiceData}) : super(key: key);
  @override
  _uvIntensityState createState() => _uvIntensityState();
}

class _uvIntensityState extends State<uvIntensity> {
  //final Stream<String> stream = Stream.periodic(Duration(seconds: 1), (x) => x);
  Future<String> getData() async{
    String a = await Future.delayed(Duration(seconds: 1));
    return a;
  }
  @override
  Widget build(BuildContext context) {
    String str = widget.ServiceData;
    String target = "[";
    int target_num = str.indexOf(target);
    String result = str.substring(target_num, (str.substring(target_num).indexOf("]")+target_num+1));

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
                  flex: 1, child: Center(child: Text('UV Intensity'))),
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
              )
            ),
            SizedBox(height: 30),
            Text(
              'UV Power',
              style: TextStyle(
                color: Colors.grey[600],
                //fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            SizedBox(height: 20),
            StreamBuilder<int> (
              stream: stream, //
              builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                return Text('${snapshot.data} seconds passed'); // 1초에 한번씩 업데이트 된다.
              },
            ),
            Container(
              child: Text(result),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFFef7f11)),
                borderRadius: BorderRadius.all(Radius.circular(5))
              ),
            ),
            SizedBox(height: 20),
            Text(
              'MIN : 0.000mW/㎠',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 18,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'MAX : 0.000mW/㎠',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 18,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'AVG : 0.000mW/㎠',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 18,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  child: Text(
                    'START',
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
                RaisedButton(
                  child: Icon(Icons.camera_alt, color: Colors.white,),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7),
                      side: BorderSide(color: Color(0x335f3206), width: 2)),
                  onPressed: () {},
                  color: Color(0xFFef7f11),
                ),
                RaisedButton(
                  child: Icon(Icons.save, color: Colors.white,),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7),
                      side: BorderSide(color: Color(0x335f3206), width: 2)),
                  onPressed: () {},
                  color: Color(0xFFef7f11),
                )
              ],
            )
          ],
        ),
      )
    );
  }
}