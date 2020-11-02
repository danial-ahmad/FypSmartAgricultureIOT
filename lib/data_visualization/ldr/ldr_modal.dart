class LDR {
  final dynamic light_intensity;
  final String light_status;
  

  LDR({this.light_intensity, this.light_status});

  factory LDR.fromJson(Map<dynamic, dynamic> json) {

    String l="h";
    dynamic parser(dynamic source) {
      try {
        return source;
      } on FormatException {
        return l;
      }
    }

    return LDR(
        light_intensity: parser(json['light-intensity']),
        light_status: parser(json['light-status'])
    );
        
  }
}