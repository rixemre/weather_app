// weather_services.dart

import 'package:geolocator/geolocator.dart';
import 'package:dio/dio.dart';
import 'package:hello_flutter/weather_app/models/weather_models.dart';

class WeatherService {
  Future<List<WeatherModels>> getWeatherData() async {
    // ... (Konum izni kodlarınız burada aynı kalıyor) ...

    //Kullanıcının konum bilgisini açıp açmadığını kontrol ediyoruz
    final bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Future.error("Konum özelliğini açmalısınız");
    }
    //Kullanıcının konum izni verip vermediğini kontrol ediyoruz vermediyse konum izni vermesini istiyoruz
    final LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      Geolocator.requestPermission();
      Future.error("Konum izni verilmedi");
    }

    if (permission == LocationPermission.deniedForever) {
      Future.error(
        "Konum izni kalıcı olarak reddedildi. Ayarlardan izin verin.",
      );
    }
    //Kullanıcının pozisyonu alınır
    final Position position = await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(accuracy: LocationAccuracy.high),
    );

    final double lat = position.latitude;
    final double lon = position.longitude;
    final url =
        'https://api.open-meteo.com/v1/forecast'
        '?latitude=$lat'
        '&longitude=$lon'
        '&daily=temperature_2m_max,temperature_2m_min'
        '&forecast_days=7'
        '&timezone=auto';

    final dio = Dio();
    final response = await dio.get(url);

    if (response.statusCode != 200) {
      return Future.error("Bir hata oluştu!");
    }

    // --- BURADAN İTİBAREN DEĞİŞİKLİK BAŞLIYOR ---

    final data = response.data;

    // API'den gelen "daily" ve "daily_units" bloklarını alıyoruz
    final dailyData = data['daily'] as Map<String, dynamic>;
    final dailyUnitsData = data['daily_units'] as Map<String, dynamic>;

    // Veri listelerini çekiyoruz
    final timeList = dailyData['time'] as List;
    final maxTempList = dailyData['temperature_2m_max'] as List;
    final minTempList = dailyData['temperature_2m_min'] as List;

    // Sıcaklık birimini alıyoruz (birim hepsinde aynıdır)
    final unit = dailyUnitsData['temperature_2m_max'] as String;

    // Döneceğimiz boş listeyi oluşturuyoruz
    List<WeatherModels> forecasts = [];

    // API'den gelen liste uzunluğu kadar (7 gün) dönüyoruz
    for (int i = 0; i < timeList.length; i++) {
      // Her gün için bir WeatherModels nesnesi oluşturuyoruz
      final day = timeList[i] as String;
      // API'den gelen değer 'num' (int veya double) olabilir, 'toDouble()' ile garantiliyoruz
      final maxTemp = (maxTempList[i] as num).toDouble();
      final minTemp = (minTempList[i] as num).toDouble();

      // Oluşturduğumuz modeli listeye ekliyoruz
      forecasts.add(
        WeatherModels(gun: day, max: maxTemp, min: minTemp, birim: unit),
      );
    }

    // Doldurduğumuz 7 günlük listeyi döndürüyoruz
    return forecasts;
  }
}
