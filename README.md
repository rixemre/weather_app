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
- **Dio** ->HTTP istekleri için

### 🧭 Geolocator

Cihaz konumunu almak için **Geolocator** paketi kullanılır.

**Kurulum:**
`bash
flutter pub add geolocator`
**Kullanım Örneği:**

`// 1️⃣ Servis açık mı kontrol et
final bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

// 2️⃣ İzinleri kontrol et
LocationPermission permission = await Geolocator.checkPermission();

// 3️⃣ Gerekirse izin iste
if (permission == LocationPermission.denied) {
  permission = await Geolocator.requestPermission();
}

// 4️⃣ Konumu al
final Position position = await Geolocator.getCurrentPosition(
  locationSettings: const LocationSettings(
    accuracy: LocationAccuracy.high,
  ),
);
print(position);`

### 🌐 Dio

**Dio**, Flutter projelerinde HTTP istekleri yapmak için kullanılır.

**Kurulum:**
`bash
flutter pub add dio`
**Kullanım örneği:**

`// 1️⃣ Dio nesnesi oluştur
final dio = Dio();

// 2️⃣ GET isteği yap
final response = await dio.get('https://api.open-meteo.com/v1/forecast');

// 3️⃣ Yanıtı kontrol et
if (response.statusCode == 200) {
  print(response.data);
} else {
  print("İstek başarısız oldu: ${response.statusCode}");
}
`

### Yapılandırma (API)
- Open-Meteo günlük/saatlik değişkenleri URL parametreleriyle seçilir.
- Örnek(günlük):
`https://api.open-meteo.com/v1/forecast?latitude=41.01&longitude=28.97&daily=temperature_2m_max,temperature_2m_min,weathercode&timezone=auto`

### İzinler
- Konum kullanacaksan Android/iOS'ta ilgili location izinlerini ekle.
- Web'de tarayıcı konum iznini test et.


