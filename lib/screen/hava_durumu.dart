import 'package:flutter/material.dart';
import 'package:mobil_uygulama/screen/models/hava_durumu_model.dart';
import 'package:http/http.dart' as http;

class WeatherWidget extends StatefulWidget {
  const WeatherWidget({Key? key}) : super(key: key);

  @override
  State<WeatherWidget> createState() => _WeatherWidgetState();
}

class _WeatherWidgetState extends State<WeatherWidget> {
  late double _screenWidth, _screenHeight;

  List<Weather>? weathers;
  bool loading = true;

  Future<void> getWeather() async {
    var url = Uri.parse("http://api.alacasoft.com/api/Weather?cityId=42");
    final result = await http.get(url);
    setState(() {
      weathers = weatherFromJson(result.body);
      weathers?.sort((a, b) => a.datetime.compareTo(b.datetime));
      loading = false;
    });
  }

  @override
  void initState() {
    getWeather();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    _screenWidth = size.width;
    _screenHeight = size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text("HAVA DURUMU"),
        backgroundColor: Color.fromARGB(255, 0, 209, 146),
        centerTitle: true,
      ),
      body: _weatherContainer(),
    );
  }

  BoxDecoration box_decoration_white_radius20() => BoxDecoration(
      color: Colors.white, borderRadius: BorderRadius.circular(10));

  Widget _weatherContainer() => loading
      ? Center(
          child: CircularProgressIndicator(),
        )
      : Container(
          decoration: box_decoration_white_radius20(),
          margin: const EdgeInsets.fromLTRB(20, 20, 0, 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  _weatherDayCard(weathers?[1]),
                  _weatherDayCard(weathers?[2]),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  _weatherDayCard(weathers?[3]),
                  _weatherDayCard(weathers?[4]),
                ],
              ),
            ],
          ),
        );

  BoxDecoration box_decoration_white_shadow_circular_20() => BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color.fromARGB(255, 116, 233, 122),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.01),
            spreadRadius: 10,
            blurRadius: 3,
            offset: const Offset(0, 0),
          ),
        ],
      );

  TextStyle text_style_fontsize_008_bold_black({required double screenWidth}) =>
      TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black);

  Widget _weatherDayCard(Weather? weather) => Expanded(
        child: Container(
          height: _screenHeight * 0.2,
          decoration: box_decoration_white_shadow_circular_20(),
          margin: const EdgeInsets.symmetric(horizontal: 7),
          child: Column(
            children: [
              Spacer(),
              Text(
                weather?.day ?? "",
                style: text_style_fontsize_008_bold_black(
                    screenWidth: _screenWidth),
              ),
              Spacer(),
              Image.network("http:${weather?.icon ?? ""}"),
              Spacer(),
              Text("${weather?.heat ?? ""} C",
                  style: text_style_fontsize_008_bold_black(
                      screenWidth: _screenWidth)),
              Spacer(),
              _iconText(
                  iconPath: "assets/images/humidity_icon.png",
                  text: "${weather?.humidity ?? ""}%"),
              const SizedBox(
                height: 4,
              ),
              _iconText(
                  iconPath: "assets/images/wind_speed_icon.png",
                  text: "${weather?.windKph ?? ""}km/H"),
              Spacer(),
            ],
          ),
        ),
      );

  Color textGrey = const Color(0xFF808080);

  TextStyle text_style_fontsize_006_textGrey({required double screenWidth}) =>
      TextStyle(fontSize: 14, color: textGrey);

  Widget _iconText({required String iconPath, required String text}) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            iconPath,
          ),
          SizedBox(
            width: _screenWidth * 0.004,
          ),
          Text(
            text,
            style: text_style_fontsize_006_textGrey(screenWidth: _screenWidth),
          )
        ],
      );
}
