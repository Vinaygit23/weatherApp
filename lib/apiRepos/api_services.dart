import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../constant/base_url.dart';
import '../model/weather_model.dart';
class ApiServices{

  static Future<WeatherModel?> getWeatherData()async {
    String countryName = 'India';
    String city = 'Varanasi';
    String state = 'Uttar Pradesh';
    String weatherOrForecast = 'forecast';
    var response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/$weatherOrForecast?q=$city,$state,$countryName&APPID=$openWeatherApiKey'
    ));
    if(response.statusCode == 200){
      return weatherModelFromJson(response.body);
    }else{
      return null;
    }
  }
}