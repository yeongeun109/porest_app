import 'package:flutter/material.dart';
import 'package:google_maps_place_picker/google_maps_place_picker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class map4 extends StatelessWidget {
  // Light Theme
  final ThemeData lightTheme = ThemeData.light().copyWith(
    // Background color of the FloatingCard
    cardColor: Colors.white,
    buttonTheme: ButtonThemeData(
      // Select here's button color
      buttonColor: Colors.black,
      textTheme: ButtonTextTheme.primary,
    ),
  );

  // Dark Theme
  final ThemeData darkTheme = ThemeData.dark().copyWith(
    // Background color of the FloatingCard
    cardColor: Colors.grey,
    buttonTheme: ButtonThemeData(
      // Select here's button color
      buttonColor: Colors.yellow,
      textTheme: ButtonTextTheme.primary,
    ),
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google Map Place Picker Demo',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.light,
      home: map4Page(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class map4Page extends StatefulWidget {
  const map4Page({Key key}) : super(key: key);

  static final kInitialPosition = LatLng(-33.8567844, 151.213108);

  @override
  _map4PageState createState() => _map4PageState();
}

class _map4PageState extends State<map4Page> {
  PickResult selectedPlace;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Google Map Place Picer Demo"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text("Load Google Map"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return PlacePicker(
                          apiKey: 'AIzaSyCsRz7mF4K1lYle6CamNiefCu1UouqhVnQ',
                          initialPosition: map4Page.kInitialPosition,
                          useCurrentLocation: true,
                          //usePlaceDetailSearch: true,
                          onPlacePicked: (result) {
                            selectedPlace = result;
                            Navigator.of(context).pop();
                            setState(() {});
                            List<String> arr = selectedPlace.formattedAddress.split(' ');
                            print(arr[1]+'\n'+arr[2]);
                          },
                          autocompleteLanguage: "ko",
                          region: 'au',
                          /*forceSearchOnZoomChanged: true,
                          automaticallyImplyAppBarLeading: false,
                          autocompleteLanguage: "ko",
                          region: 'au',
                          selectInitialPosition: true,
                           selectedPlaceWidgetBuilder: (_, selectedPlace, state, isSearchBarFocused) {
                             print("state: $state, isSearchBarFocused: $isSearchBarFocused");
                             return isSearchBarFocused
                                 ? Container()
                                 : FloatingCard(
                                     bottomPosition: 0.0,    // MediaQuery.of(context) will cause rebuild. See MediaQuery document for the information.
                                     leftPosition: 0.0,
                                     rightPosition: 0.0,
                                     width: 500,
                                     borderRadius: BorderRadius.circular(12.0),
                                     child: state == SearchingState.Searching
                                         ? Center(child: CircularProgressIndicator())
                                         : RaisedButton(
                                             child: Text("Pick Here"),
                                             onPressed: () {
                                               // IMPORTANT: You MUST manage selectedPlace data yourself as using this build will not invoke onPlacePicker as
                                               //            this will override default 'Select here' Button.
                                               print("do something with [selectedPlace] data");
                                               Navigator.of(context).pop();
                                             },
                                           ),
                                   );
                           },
                           pinBuilder: (context, state) {
                             if (state == PinState.Idle) {
                               return Icon(Icons.favorite_border);
                             } else {
                               return Icon(Icons.favorite);
                             }
                           },*/
                        );
                      },
                    ),
                  );
                },
              ),
              //selectedPlace == null ? Container() : Text(selectedPlace.formattedAddress ?? ""),
            ],
          ),
        ));
  }
}