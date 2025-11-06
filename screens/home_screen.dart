// ignore_for_file: avoid_print, unused_field, unused_local_variable
import 'package:flutter/material.dart';
import 'package:hello_flutter/weather_app/models/weather_models.dart';
import 'package:hello_flutter/weather_app/services/weather_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<WeatherModels> _weathers = [];

  //Hava durumunu listemize çektiğimiz fonksiyon
  void _getWeatherData() async {
    _weathers = await WeatherService().getWeatherData();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _getWeatherData();
  }

  //Hava durumu koduna göre hava durumunun ikonunu belirlediğimiz fonksiyon
  String getWeatherIcon(double code) {
    if (code == 0) return "☀️";
    if (code == 1 || code == 2 || code == 3) return "🌤️";
    if (code == 45 || code == 48) return "🌫️";
    if (code >= 51 && code <= 67) return "🌧️";
    if (code >= 71 && code <= 77) return "❄️";
    if (code >= 80 && code <= 82) return "🌦️";
    if (code >= 95) return "⛈️";
    return "🌈";
  }

  //Uygulama ekranı tasarımı kısmı
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("7 Günlük Hava Tahmini")),
      body: ListView.builder(
        itemCount: _weathers.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.blueGrey.shade100,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(_weathers[index].gun),
                Text(
                  "Max: ${_weathers[index].max}${_weathers[index].birim}\n"
                  "Min: ${_weathers[index].min}${_weathers[index].birim}",
                  textAlign: TextAlign.right,
                ),
                Text(
                  getWeatherIcon(_weathers[index].weatherCode),
                  style: TextStyle(fontSize: 40),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
