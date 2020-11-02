class WeatherData {
  final DateTime date;
  final String name;
  final double temp;
  final String main;
  final String icon;
  final double pressure;
  final String description;
  final double humidity;

  WeatherData({this.date, this.name, this.temp, this.main, this.icon,this.description,this.pressure,this.humidity});

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      date: new DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000, isUtc: false),
      name: json['name'].toString(),
      temp: json['main']['temp'].toDouble(),
      pressure: json['main']['pressure'].toDouble(),
      humidity: json['main']['humidity'].toDouble(),
      main: json['weather'][0]['main'],
      icon: json['weather'][0]['icon'],
      description: json['weather'][0]['description'],
     

    );
  }
}