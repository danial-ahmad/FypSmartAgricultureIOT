class DHTsoil {
  final double temp;
  

  DHTsoil({this.temp});

  factory DHTsoil.fromJson(Map<dynamic, dynamic> json) {
    double parser(dynamic source) {
      try {
        return double.parse(source.toString());
      } on FormatException {
        return -1;
      }
    }

    return DHTsoil(
        temp: parser(json['temp']),
       );
  }
}