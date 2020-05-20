import 'dart:async';
import 'dart:convert';
import 'package:convert_hex/convert_hex.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_blue/flutter_blue.dart';

class uvIntensity extends StatefulWidget {
  //final String ServiceData;
  const uvIntensity({Key key, this.device}) : super(key: key);
  final BluetoothDevice device;

  @override
  _uvIntensityState createState() => _uvIntensityState();
}

class _uvIntensityState extends State<uvIntensity> {
  final String SERVICE_UUID = "6e400001-b5a3-f393-e0a9-e50e24dcca9e";
  final String CHARACTERISTIC_UUID = "6e400003-b5a3-f393-e0a9-e50e24dcca9e";
  bool isReady, connectionFlag = false;
  Stream<List<int>> stream;
  List<double> traceDust = List();
  String band;

  @override
  void initState() {
    super.initState();
    isReady = false;

  }

  connectToDevice() async {
    if (widget.device == null) {
      _Pop();
      return;
    }

    new Timer(const Duration(seconds: 15), () {
      if (!isReady) {
        disconnectFromDevice();
        _Pop();
      }
    });

    await widget.device.connect();
    discoverServices();
  }

  disconnectFromDevice() {
    if (widget.device == null) {
      _Pop();
      return;
    }

    widget.device.disconnect();
  }

  discoverServices() async {
    if (widget.device == null) {
      _Pop();
      return;
    }

    List<BluetoothService> services = await widget.device.discoverServices();
    services.forEach((service) {
      if (service.uuid.toString() == SERVICE_UUID) {
        service.characteristics.forEach((characteristic) {
          if (characteristic.uuid.toString() == CHARACTERISTIC_UUID) {
            characteristic.setNotifyValue(!characteristic.isNotifying);
            stream = characteristic.value;

            setState(() {
              isReady = true;
            });
          }
        });
      }
    });

    if (!isReady) {
      _Pop();
    }
  }

  Future<bool> _onWillPop() {
    return showDialog(
        context: context,
        builder: (context) =>
        new AlertDialog(
          title: Text('Are you sure?'),
          content: Text('Do you want to disconnect device and go back?'),
          actions: <Widget>[
            new FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text('No')),
            new FlatButton(
                onPressed: () {
                  disconnectFromDevice();
                  Navigator.of(context).pop(true);
                },
                child: new Text('Yes')),
          ],
        ) ??
            false);
  }

  _Pop() {
    Navigator.of(context).pop(true);
  }

  String _dataParser(List<int> dataFromDevice) {
    String a = utf8.decode(dataFromDevice);
    print(a);
    List<String> arr = a.split(' ');
    List<int> arr2;
    String result;

    if(Hex.decode(arr[1]) <= 3100)
      result = Hex.decode(arr[1]).toString();
    else if(Hex.decode(arr[2]) <= 3100)
      result = Hex.decode(arr[2]).toString();
    else if(Hex.decode(arr[3]) <= 3100)
      result = Hex.decode(arr[3]).toString();
    else
      result = Hex.decode(arr[4]).toString();

    if(Hex.decode(arr[6]) > 7)
      band = 'UNKNOWN';
    else
      band = 'something';

    return result;
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
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
                Expanded(flex: 1, child: Center(child: Text('UV Intensity'))),
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
                      'UV Band : ${band}',
                      style: TextStyle(
                        color: Colors.grey[600],
                        //fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  ],
                )),
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
                Container(
                  height: 80,
                  width: 280,
                  child: StreamBuilder<List<int>>(
                    stream: stream,
                    builder: (BuildContext context,
                        AsyncSnapshot<List<int>> snapshot) {
                      if (snapshot.hasError)
                        return Text('Error: ${snapshot.error}');

                      if (snapshot.connectionState ==
                          ConnectionState.active) {
                        var currentValue = _dataParser(snapshot.data);
                        print(currentValue);
                        return Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text('${currentValue}',
                                        style: TextStyle(fontSize: 16))
                                      ]
                                  )
                                ),
                              ],
                            ));
                      } else {
                        return Text('Check the stream');
                      }
                    },
                  ),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFFef7f11)),
                      borderRadius: BorderRadius.all(Radius.circular(5))),
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
                    !connectionFlag ?
                    RaisedButton(
                      child:  Text(
                        'START',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7),
                          side: BorderSide(color: Color(0x335f3206), width: 2)),
                      onPressed: () {
                        connectToDevice();
                      },
                      color: Color(0xFFef7f11),
                    ) : RaisedButton(
                      child:  Text(
                        'STOP',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7),
                          side: BorderSide(color: Color(0x335f3206), width: 2)),
                      onPressed: () {
                        disconnectFromDevice();
                        setState(() {
                          connectionFlag = false;
                        });
                      },
                      color: Color(0xFFef7f11),
                    ),
                    RaisedButton(
                      child: Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7),
                          side: BorderSide(color: Color(0x335f3206), width: 2)),
                      onPressed: () {},
                      color: Color(0xFFef7f11),
                    ),
                    RaisedButton(
                      child: Icon(
                        Icons.save,
                        color: Colors.white,
                      ),
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
          )),
    );
  }
}