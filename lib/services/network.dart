import 'dart:convert';
import 'package:http/http.dart' as http;

class GetWeatherService {
  final endPoint;

  GetWeatherService({required this.endPoint});

  Future getData() async {
    final url = Uri.parse(endPoint);
    try {
      var response = await http.get(url);
      print(response.body);
      print(response.statusCode);
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        return result;
      }
    } on Exception catch (e) {
      print(e);
      // TODO
    }
  }
}
