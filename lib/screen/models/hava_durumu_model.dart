import 'dart:convert';

List<Weather> weatherFromJson(String str) =>
    List<Weather>.from(json.decode(str).map((x) => Weather.fromJson(x)));

class Weather {
  Weather({
    required this.id,
    required this.cityId,
    required this.heat,
    required this.icon,
    required this.datetime,
    required this.humidity,
    required this.windKph,
    required this.day,
  });

  String id;
  int cityId;
  String heat;
  String icon;
  DateTime datetime;
  String humidity;
  String windKph;
  String day;

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        id: json["Id"],
        cityId: json["CityId"],
        heat: json["Heat"],
        icon: json["Icon"],
        datetime: DateTime.parse(json["Datetime"]),
        humidity: json["Humidity"],
        windKph: json["Wind_kph"],
        day: json["Day"],
      );
}
