# Weather App (Flutter)

Basit ve hızlı bir **hava durumu uygulaması**. Kullanıcının konumuna göre Open-Meteo API’dan sıcaklık ve hava durumu tahminlerini çeker.  
Dio ile API istekleri yapılır, Geolocator ile konum bilgisi alınır.

## ✨ Özellikler
- Open-Meteo’dan **günlük/saatlik** tahminler  
- Maksimum / minimum sıcaklık  
- **weathercode → ikon** eşlemesi ile ☀️/🌧️/❄️  

## 🧰 Teknolojiler
- **Flutter/Dart**  
- **Open-Meteo Forecast API** (ücretsiz, anahtarsız)
- **Geolocator** -> Cihaz konumunu almak için
  Geolocator kurulumu: 
  `$ flutter pub add geolocator`
  Kullanım örnekleri:
  `final bool serviceEnabled = await Geolocator.isLocationServiceEnabled();`
  `final LocationPermission permission = await Geolocator.checkPermission();`
  `final Position position = await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(accuracy: LocationAccuracy.high),
    );`
- **Dio** ->HTTP istekleri için
  Dio kurulumu:
  `$ flutter pub add dio`
  Kullanım örneği:
  `final dio = Dio();`
  `final response = await dio.get(url);`

### Yapılandırma (API)
- Open-Meteo günlük/saatlik değişkenleri URL parametreleriyle seçilir.
- Örnek(günlük):
`https://api.open-meteo.com/v1/forecast?latitude=41.01&longitude=28.97&daily=temperature_2m_max,temperature_2m_min,weathercode&timezone=auto`

### İzinler
- Konum kullanacaksan Android/iOS'ta ilgili location izinlerini ekle.
- Web'de tarayıcı konum iznini test et.


