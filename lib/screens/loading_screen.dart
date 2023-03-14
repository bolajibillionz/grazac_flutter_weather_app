import '../services/location.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    getLocationData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
      // body: Center(
      //   child: ElevatedButton(
      //     onPressed: () {
      //       getLocation();
      //       //Get the current location
      //     },
      //     child: Text('Get Location'),
      //   ),
      // ),
    );
  }

  void getLocationData() {
    Location location = Location();
    var newLocation = location.getLocation();
  }
}
