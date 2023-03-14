import 'package:geolocator/geolocator.dart';
import 'package:grazac_weather_app/services/key.dart';
import 'package:grazac_weather_app/services/network.dart';
import 'package:grazac_weather_app/services/api_endpoints.dart';

class Location {
  late double latitude;
  late double longitude;

  Future<void> getLocation() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        return Future.error('Location not available');
      } else {
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);
        latitude = position.latitude;
        longitude = position.longitude;
        print(position);
        print(latitude);
        print(longitude);

        
      }
    }
  }
}
