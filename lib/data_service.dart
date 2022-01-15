import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nim_181011450578/weather_model.dart';

//api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}
//appid = bcf30943ab8c7ecf83e1414e79fab780

class DataService {
  Future<Weather> fetchData(String cityName) async {
    try {
      final queryParameter = {
        'q': cityName,
        'appid': 'bcf30943ab8c7ecf83e1414e79fab780',
        'units': 'imperial'
      };
      final uri = Uri.https('api.openweathermap.org', '/data/2.5/weather', queryParameter);
      final response = await http.get(uri);
      return Weather.fromJson(jsonDecode(response.body));
    } catch (e) {
      rethrow;
    }
  }
}
