import 'package:SmartAgriculture/weather/models/WeatherData.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';



class Weather extends StatelessWidget {
  final WeatherData weather;
  

  Weather({Key key, @required this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Column(
      children: <Widget>[
        
        Text(weather.name, style: new TextStyle(color: Colors.white,fontSize: 42.0)),
        Text(weather.main, style: new TextStyle(color: Colors.white, fontSize: 32.0)),
         Text(weather.description, style: new TextStyle(color: Colors.white)),
        Text('${(((weather.temp)-273.15 )).round().toString()}°C',  style: new TextStyle(color: Colors.white,fontSize: 32.0)),
        Text('Pressure:${weather.pressure.toString()}Pa', style: new TextStyle(color: Colors.white)),
         Text('Humidity:${weather.humidity.toString()}', style: new TextStyle(color: Colors.white)),
        Image.network('https://openweathermap.org/img/wn/${weather.icon}@2x.png',width: 150,height: 150,),
        Text(new DateFormat.yMMMd().format(weather.date), style: new TextStyle(color: Colors.white)),
        Text(new DateFormat.Hm().format(weather.date), style: new TextStyle(color: Colors.white)),
      ],
    );
  }
}