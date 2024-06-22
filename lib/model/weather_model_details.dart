
class WeatherData {

  final String? cityName;

  final String? countryCode;
  final String? datetime;
  final dynamic lat;
  final dynamic lon;
  final dynamic snow;
  final String? sunrise;
  final String? sunset;
  final dynamic temp;
  final String? timezone;
  final WeatherDetails? weather;
  final String? windDir;


  WeatherData({

    this.cityName,

    this.countryCode,
    this.datetime,
    this.lat,
    this.lon,
    this.snow,
    this.sunrise,
    this.sunset,
    this.temp,
    this.timezone,
    this.weather,
    this.windDir,

  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(

      cityName: json['city_name'] ?? "",

      countryCode: json['country_code']??"",
      datetime: json['datetime']??"",
      lat: json['lat'] ?? 0.0,
      lon: json['lon'] ?? 0.0,
      snow: json['snow'] ?? 0 ,
      sunrise: json['sunrise'] ?? "",
      sunset: json['sunset'] ?? "",
      temp: json['temp'] ?? 0.0,
      timezone: json['timezone'] ?? "",
      weather: WeatherDetails.fromJson(json['weather'] ??WeatherDetails() ),
      windDir: json['wind_cdir_full'] ?? "",
    );
  }
}

class WeatherDetails {
  final String? icon;
  final String? description;


  WeatherDetails({
    this.icon,
    this.description,

  });

  factory WeatherDetails.fromJson(Map<String, dynamic> json) {
    return WeatherDetails(
      icon: json['icon'] ?? "",
      description: json['description'] ?? "",

    );
  }
}
