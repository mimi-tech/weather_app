import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/repository/feedback.dart';
import 'package:weather_app/repository/weather_repository.dart';
import 'package:flutter/foundation.dart';

/// A provider class to manage the weather data and state for the application.
///
/// The `WeatherProvider` class interacts with the `WeatherRepository` to fetch weather data,
/// handles loading and error states, and caches the weather data in-memory to optimize
/// performance and reduce redundant network requests.

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


    /// Fetches weather data for the specified city and/or postal code.
    ///
    /// This method checks the in-memory cache before making a network request.
    /// If the data is already cached, it uses the cached data. Otherwise, it
    /// fetches the data from the repository, caches it, and updates the state.
    ///
    /// Parameters:
    /// - `city` (String): The name of the city for which to fetch weather information.
    /// - `postalCode` (String): The postal code for which to fetch weather information.
    ///
    /// Returns:
    /// - `Future<void>`: A future that completes when the weather data has been fetched and the state updated.

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