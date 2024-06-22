import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/constants.dart';
import 'package:weather_app/repository/feedback.dart';

class WeatherRepository{

  /// Fetches weather information for the specified city and/or postal code.
  ///
  /// This function constructs a URL for a weather API based on the provided city and postal code.
  /// It then makes an HTTP GET request to this URL. If the request is successful (status code 200),
  /// the response body is parsed as JSON and returned inside a `Success` object. If there is an
  /// error during the process, a `Failure` object is returned containing the error message.
  ///
  /// The function assumes that `weatherUrl` and `weatherApiKey` are defined elsewhere in your code.
  ///
  /// Parameters:
  /// - `city` (String): The name of the city for which to fetch weather information. Can be empty.
  /// - `postalCode` (String): The postal code for which to fetch weather information. Can be empty.
  ///
  /// Returns:
  /// - `Future`: A future that resolves to either a `Success` object containing the weather data,
  ///   or a `Failure` object containing an error message.

  Future getWeather(String city, String postalCode,) async{
    try{
      String url = "";
      // Build the URL based on provided city and postal code
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
      // If the request was successful, parse and return the JSON data
      if(response.statusCode == 200){
        final jsonData = json.decode(response.body);
        return Success(data: jsonData);
      }
    }catch(e){
      return Failure(errorResponse: e.toString());
    }
  }
}