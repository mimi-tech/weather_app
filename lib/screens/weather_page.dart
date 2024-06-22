import 'package:flutter/material.dart';
import 'package:weather_app/model/weather_model.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key, required this.weatherData});
  final WeatherModel weatherData;
  @override
  Widget build(BuildContext context) {
    final weather = weatherData.data?[0];

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.04,),
      Text(weather?.cityName ?? "",
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white
      ),
      ),

        SizedBox(height: MediaQuery.of(context).size.height * 0.02,),

        Text(weather?.timezone ?? "",
          style: const TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
              color: Colors.white
          ),
        ),

        Text(weather?.datetime ?? "",
          style: const TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: Colors.white
          ),
        ),


    SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
    //SvgPicture.asset("assets/icon-weather.svg"),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
        Text(weather?.weather?.description??"",
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
              color: Colors.white
          ),
        ),

    SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
    Text("${weather?.temp}℃",
    style: const TextStyle(
    fontSize: 90,
    fontWeight: FontWeight.w500,
        color: Colors.white
    )),

        SizedBox(height: MediaQuery.of(context).size.height * 0.02,),

        Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18.0),
            color: Colors.pinkAccent
          ),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(

              children: [


                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Sunrise: ${weather?.sunrise}",
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        )),

                    Text("Sunset: ${weather?.sunset}",
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        )),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text("Snow:${weather?.snow}",
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        )),

                    Text("Wind:${weather?.windDir}",
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        )),
                  ],
                )
              ],
            ),
          ),
        )

      ],
    );
  }
}
