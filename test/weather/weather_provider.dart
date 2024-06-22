import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/provider/weather_provider.dart';
import 'package:weather_app/repository/feedback.dart';
import 'package:weather_app/repository/weather_repository.dart';

import 'mock_api.dart';
import 'weather_provider.mocks.dart';


@GenerateMocks([WeatherRepository])
void main() {
  group('WeatherProvider', () {
    late MockWeatherRepository mockWeatherRepository;
    late WeatherProvider weatherProvider;

    setUp(() {
      mockWeatherRepository = MockWeatherRepository();
      weatherProvider = WeatherProvider(mockWeatherRepository);
    });

    test('initial values are correct', () {
      expect(weatherProvider.weatherData, isA<WeatherModel>());
      expect(weatherProvider.errorMessage, isNull);
      expect(weatherProvider.isLoading, isFalse);
    });

    test('fetchWeather sets loading to true initially and false finally', () async {
      final weatherData = {'key': 'value'};
      when(mockWeatherRepository.getWeather(any, any)).thenAnswer((_) async => Success(data: weatherData));

      final future = weatherProvider.fetchWeather('city', 'postalCode');

      expect(weatherProvider.isLoading, isTrue);
      await future;
      expect(weatherProvider.isLoading, isFalse);
    });

    test('fetchWeather sets weatherData on success', () async {

      when(mockWeatherRepository.getWeather(any, any)).thenAnswer((_) async => Success(data: mockAPI));

      await weatherProvider.fetchWeather('city', 'postalCode');
      expect(weatherProvider.isLoading, false);
      expect(weatherProvider.weatherData.data?[0].cityName, "Owerri");
      expect(weatherProvider.errorMessage, isNull);
    });

    test('fetchWeather sets errorMessage on failure', () async {
      const error = 'Error occurred';
      when(mockWeatherRepository.getWeather(any, any)).thenAnswer((_) async => Failure(errorResponse: error));

      await weatherProvider.fetchWeather('city', 'postalCode');

      expect(weatherProvider.errorMessage, error);
      expect(weatherProvider.weatherData, isA<WeatherModel>());
    });
  });
}
