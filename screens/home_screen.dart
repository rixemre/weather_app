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

  void _getWeatherData() async {
    _weathers = await WeatherService().getWeatherData();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _getWeatherData();
  }

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
              ],
            ),
          );
        },
      ),
    );
  }
}
