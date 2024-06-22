import 'package:weather_app/model/weather_model_details.dart';

class WeatherModel {
  final int? count;
  final List<WeatherData>? data;

  WeatherModel({ this.count,  this.data});

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      count: json['count'],
      data: (json['data'] as List).map((i) => WeatherData.fromJson(i)).toList(),
      //data: (json['data']as List).map((json) => WeatherData.fromJson((json))).toList(),
    );
  }
}