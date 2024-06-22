import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/constants.dart';
import 'package:weather_app/repository/feedback.dart';

class WeatherRepository{
  final url = "https://api.restful-api.dev/objects";

  Future getWeather(String city, String postalCode,) async{
    try{
      String url = "";
      if(city.isNotEmpty && postalCode.isNotEmpty){
        url = "$weatherUrl?city=$city&postal_code=$postalCode&key=$weatherApiKey";
      }
      if(city.isNotEmpty){
        url = "$weatherUrl?city=$city&key=$weatherApiKey";
      }
      if(postalCode.isNotEmpty){
        url = "$weatherUrl?postal_code=$postalCode&key=$weatherApiKey";
      }

      final response = await http.get(Uri.parse(url));
      if(response.statusCode == 200){
        final jsonData = json.decode(response.body);
        return Success(data: jsonData);
      }
    }catch(e){
      return Failure(errorResponse: e.toString());
    }
  }
}