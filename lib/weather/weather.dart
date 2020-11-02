import 'dart:convert';
import 'package:SmartAgriculture/weather/models/ForecastData.dart';
import 'package:SmartAgriculture/weather/models/WeatherData.dart';
import 'package:SmartAgriculture/weather/widgets/Weather.dart';
import 'package:SmartAgriculture/weather/widgets/WeatherItem.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/services.dart';



void main() => runApp(new WeatherApp());

class WeatherApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new WeatherAppState();
  }
}

class WeatherAppState extends State<WeatherApp> {
  bool isLoading = false;
  WeatherData weatherData;
  ForecastData forecastData;
  
  String error;

  @override
  void initState() {
    super.initState();

    loadWeather();
  }

  @override
  Widget build(BuildContext context) {
   
      return Scaffold(
        
        appBar: AppBar(
          title: Text('Weather Forecast'),
          backgroundColor: (Colors.green.shade900),
        ),
        body: Center(
          child: Container(
             decoration: BoxDecoration(
                   gradient: LinearGradient(colors: [Colors.yellow,Colors.green],begin: Alignment.topRight,end:Alignment.bottomLeft, ),
                 ),
                  alignment: Alignment.center,
            child: Column(
              
              children: <Widget>[
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: weatherData != null ? Weather(weather: weatherData) : Container(),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: isLoading ? CircularProgressIndicator(
                          strokeWidth: 2.0,
                          valueColor: new AlwaysStoppedAnimation(Colors.white),
                        ) : IconButton(
                          icon: new Icon(Icons.refresh),
                          tooltip: 'Refresh',
                          onPressed: loadWeather,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
               
              ],
            ),
          )
        )
      );
    
  }

  loadWeather() async {
    setState(() {
      isLoading = true;
    });

      final lon = '72.33';
      final lat = '31.97';

      final weatherResponse = await http.get(
          'https://api.openweathermap.org/data/2.5/weather?APPID=3b5d8e18e8264954b33350e04948a873&lat=${lat
              .toString()}&lon=${lon.toString()}');
      final forecastResponse = await http.get(
          'https://api.openweathermap.org/data/2.5/forecast?APPID=3b5d8e18e8264954b33350e04948a873&lat=${lat
              .toString()}&lon=${lon.toString()}');

      if (weatherResponse.statusCode == 200 &&
          forecastResponse.statusCode == 200) {
        return setState(() {
          weatherData =
          new WeatherData.fromJson(jsonDecode(weatherResponse.body));
          forecastData =
          new ForecastData.fromJson(jsonDecode(forecastResponse.body));
          isLoading = false;
        });
      }
    }
   
  
   
  }
