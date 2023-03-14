import 'package:flutter/material.dart';

const String BASE_URL = 'https://api.openweathermap.org/data/2.5/weather?';


class ApiEndpoints {
  static String getWeatherByLatLong(
      {required double lat, required double long, required String key}) {
    return '${BASE_URL}lat=$lat&lon=$long&appid=$key';
  }

  static String getWeatherByCityName({required String city, required String key}) {
    return '${BASE_URL}q=$city&appid=$key';
  }
}
