import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:weather_app/constants.dart';
import 'package:weather_app/repository/feedback.dart';
import 'package:weather_app/repository/weather_repository.dart';
import 'dart:convert';

import 'weather_repository.mocks.dart';

//
// class MockClient extends Mock implements http.Client {}
//
// @GenerateMocks([http.Client])
// void main() {
//   group('WeatherRepository', () {
//     final weatherRepository = WeatherRepository();
//     late MockClient mockClient;
//
//     setUp(() {
//       mockClient = MockClient();
//     });
//
//     test('returns Success when the http call completes successfully', () async {
//       const city = 'London';
//       const postalCode = 'E1 6AN';
//       const url =
//           'https://api.restful-api.dev/objects?city=$city&postal_code=$postalCode&key=$weatherApiKey';
//
//       when(mockClient.get(Uri.parse(url)))
//           .thenAnswer((_) async => http.Response(jsonEncode([]), 200));
//
//       final result = await weatherRepository.getWeather(city, postalCode);
//
//       expect(result, isA<Success>());
//     });
//
//     test('returns Failure when the http call completes with an error', () async {
//       const city = 'London';
//       const postalCode = 'E1 6AN';
//       const url =
//           'https://api.restful-api.dev/objects?city=$city&postal_code=$postalCode&key=$weatherApiKey';
//
//       when(mockClient.get(Uri.parse(url)))
//           .thenAnswer((_) async => http.Response('Not Found', 404));
//
//       final result = await weatherRepository.getWeather(city, postalCode);
//
//       expect(result, isA<Failure>());
//     });
//
//     test('builds correct URL for city and postal code', () async {
//       const city = 'London';
//       const postalCode = 'E1 6AN';
//       const url =
//           'https://api.restful-api.dev/objects?city=$city&postal_code=$postalCode&key=$weatherApiKey';
//
//       when(mockClient.get(Uri.parse(url)))
//           .thenAnswer((_) async => http.Response(jsonEncode([]), 200));
//
//       await weatherRepository.getWeather(city, postalCode);
//
//       verify(mockClient.get(Uri.parse(url))).called(1);
//     });
//
//     test('builds correct URL for city only', () async {
//       const city = 'London';
//       const url = 'https://api.restful-api.dev/objects?city=$city&key=$weatherApiKey';
//
//       when(mockClient.get(Uri.parse(url)))
//           .thenAnswer((_) async => http.Response(jsonEncode([]), 200));
//
//       await weatherRepository.getWeather(city, '');
//
//       verify(mockClient.get(Uri.parse(url))).called(1);
//     });
//
//     test('builds correct URL for postal code only', () async {
//       const postalCode = 'E1 6AN';
//       const url = 'https://api.restful-api.dev/objects?postal_code=$postalCode&key=$weatherApiKey';
//
//       when(mockClient.get(Uri.parse(url)))
//           .thenAnswer((_) async => http.Response(jsonEncode([]), 200));
//
//       await weatherRepository.getWeather('', postalCode);
//
//       verify(mockClient.get(Uri.parse(url))).called(1);
//     });
//   });
// }


@GenerateMocks([http.Client])
void main() {
  group('WeatherRepository', () {
    late MockClient mockClient;
    late WeatherRepository weatherRepository;

    setUp(() {
      mockClient = MockClient();
      weatherRepository = WeatherRepository();
    });

    test('getWeather with city and postalCode returns Success', () async {
      // Mock the http response
      final response = http.Response(
          '{"key": "value"}', 200, reasonPhrase: 'OK');
      when(mockClient.get(any)).thenAnswer((_) => Future.value(response));

      final result = await weatherRepository.getWeather('London', 'SW1A 1AA');

      expect(result, isA<Success>());
      final success = result as Success;
      expect(success.data, isMap);
    });

    test('getWeather with only city returns Success', () async {
      // Mock the http response
      final response = http.Response(
          '{"key": "value"}', 200, reasonPhrase: 'OK');
      when(mockClient.get(any)).thenAnswer((_) => Future.value(response));

      final result = await weatherRepository.getWeather('London', '');

      expect(result, isA<Success>());
      final success = result as Success;
      expect(success.data, isMap);
    });

    test('getWeather with only postalCode returns Success', () async {
      // Mock the http response
      final response = http.Response(
          '{"key": "value"}', 200, reasonPhrase: 'OK');
      when(mockClient.get(any)).thenAnswer((_) => Future.value(response));

      final result = await weatherRepository.getWeather('', 'SW1A 1AA');

      expect(result, isA<Success>());
      final success = result as Success;
      expect(success.data, isMap);
    });


  });
}