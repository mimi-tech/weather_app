import 'package:flutter/material.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/repository/feedback.dart';
import 'package:weather_app/repository/weather_repository.dart';

class WeatherProvider extends ChangeNotifier{

  final WeatherRepository _repository;
  String? _errorMessage;
  WeatherModel _weatherData = WeatherModel();
  bool _isLoading = false;

  // In-memory cache for weather data
  final Map<String, WeatherModel> _cache = {};

  WeatherProvider(this._repository);

  WeatherModel get weatherData => _weatherData;
  String? get errorMessage => _errorMessage;
  bool get isLoading => _isLoading;

  void _setError(String? error) {
    _errorMessage = error;
    notifyListeners();
  }

  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }

  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }


  Future<void> fetchWeather(String city, String postalCode) async{

    final cacheKey = '$city-$postalCode';

    // Check if the data is already cached
    if (_cache.containsKey(cacheKey)) {
      _weatherData = _cache[cacheKey]!;
      notifyListeners();
      return;
    }
    try{
      _setLoading(true);
      clearError();
      final response = await _repository.getWeather(city, postalCode);
      if(response is Success){
        final jsonData = response.data!;
        _weatherData =  WeatherModel.fromJson(jsonData);
        // Cache the fetched data
        _cache[cacheKey] = _weatherData;
        clearError();
      }

      if(response is Failure){
        _setError(response.errorResponse.toString());
      }

    }catch(e){
      _setError(e.toString());


    }finally{
      _setLoading(false);
    }
  }

}