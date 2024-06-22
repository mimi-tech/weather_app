import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/commons/custom_text_fields.dart';
import 'package:weather_app/commons/form_validation.dart';
import 'package:weather_app/provider/weather_provider.dart';
import 'package:weather_app/screens/weather_page.dart';


class HomePage extends StatelessWidget {
  HomePage({super.key});

  final _formKey = GlobalKey<FormState>();

  final _city = TextEditingController();
  final _postalCode = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff203331),
        title: const Text("Weather Forecast",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        )
        ,),
      body: Container(
    decoration: const BoxDecoration(
    image: DecorationImage(
    image: AssetImage('assets/weather_bg.jpg'),
    fit: BoxFit.cover,
    )),

        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: <Widget>[
              Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      CustomTextField(
                          controller: _city,
                          labelText: "City",
                          validator: FormValidator.validateCity
                      ),
                      const SizedBox(height: 10,),
                      CustomTextField(
                        controller: _postalCode,
                        labelText: "Postal Code",

                      ),


                    ],
                  ),
                ),
              ),

              Expanded(
                child: Consumer<WeatherProvider>(
                  builder: (context, weatherProvider, child) {
                    if (weatherProvider.isLoading){
                      return const Center(child: CircularProgressIndicator());
                    }
                    return ListView(
                      children: [
                        if (weatherProvider.errorMessage != null)
                          Center(child: Text(weatherProvider.errorMessage.toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                              fontSize: 20,
                            ),
                          )),
                        if(weatherProvider.weatherData.data !=  null && weatherProvider.weatherData.data!.isNotEmpty)
                       WeatherPage(weatherData: weatherProvider.weatherData,)
                      ],
                    );
                  },
                ),
              ),
              const SizedBox(height: 20,),
              const SizedBox(height: 20,),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    if (_formKey.currentState!.validate()) {
                      Provider.of<WeatherProvider>(context, listen: false).fetchWeather(
                        _city.text.trim(),
                        _postalCode.text.trim(),

                      );

                    }
                  },
                  style: ButtonStyle(
                    backgroundColor:
                    WidgetStateProperty.all(Colors.purple),
                    elevation: WidgetStateProperty.all(0),
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(28))
                      ),
                    ),
                  ),
                  child: const Text('Get Weather', style: TextStyle(color:Colors.white),),


                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
