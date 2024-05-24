import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather/model.dart/weather_model.dart';


class WeatherRepository {
  final String apiKey = 'ba11b26200888a9b43c6b8a068e1dcf3';

  Future<WeatherResponseModel> fetchWeather(dynamic city) async {
    try{
      WeatherResponseModel weatherResponseModel = WeatherResponseModel();
    final response = await http.get(Uri.parse(
        'https://openweathermap.org/data/2.5/find?q=$city&appid=$apiKey&units=metric'),
        headers: {
          'Authorization':'Bearer $apiKey'
        });


     
    if (response.statusCode == 200) {
       weatherResponseModel = WeatherResponseModel.fromJson(jsonDecode(response.body));

      if(weatherResponseModel.list!.isNotEmpty){
      return WeatherResponseModel.fromJson(jsonDecode(response.body));
      }else{
        throw Exception('Failed to load weather');
      }
    } 
    else {
      throw Exception('Failed to load weather');
    }
    }catch (e){
      throw Exception('Failed to load weather');
    }
  }
}

