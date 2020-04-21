import 'package:flutter/material.dart';
import 'package:tech/screens/WifiList.dart';
import 'package:wifi_configuration/wifi_configuration.dart';

initConnect() async {

  String networkStatus = 'null';
  WifiConnectionStatus connectionStatus =
  await WifiConfiguration.connectToWifi("JIIPKEY_A203001", "", "tech");

  if (connectionStatus == WifiConnectionStatus.connected) {
    print('connected');
  } else if (connectionStatus == WifiConnectionStatus.notConnected){
    print('notConnected');
  }
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: PageHome(),debugShowCheckedModeBanner: false,
    );
  }
}

class PageHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jiipkey', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(padding: EdgeInsets.only(bottom: 20)),
            RaisedButton(
              child: Text('connect'),
              onPressed: () => initConnect(),
              padding: EdgeInsets.all(20),
            ),
            Padding(padding: EdgeInsets.only(bottom: 20)),
            MaterialButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => WifiList()));
              },
              child: Text('Wifi List'),
              color: Colors.blue,
              textColor: Colors.white,
              padding: EdgeInsets.all(20),
            ),
          ],
        ),
      ),
    );
  }
}