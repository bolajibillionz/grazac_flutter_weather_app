import '../services/location.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:grazac_weather_app/services/key.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:grazac_weather_app/services/network.dart';
import 'package:grazac_weather_app/services/api_endpoints.dart';
import 'package:grazac_weather_app/screens/location_screen.dart';

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
      body: Center(
        child: SpinKitFadingFour(
          color: Colors.white,
          size: 100.0,
        ),
      ),
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

  void getLocationData() async {
    Location location = Location();
    var newLocation = await location.getCurrentLocation();
    print(location.latitude);
    print(location.longitude);
    GetWeatherService getWeather = GetWeatherService(
        endPoint: ApiEndpoints.getWeatherByLatLong(
            lat: location.latitude, long: location.longitude, key: apiKey));
    var response = await getWeather.getData();
    
    // weather[0].main
    // name
    // weather[0].description

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(locationWeather: response,);
    }));
  }
}
