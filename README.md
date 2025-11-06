# Weather App (Flutter)

Basit ve hızlı bir **hava durumu uygulaması**. Konuma göre Open-Meteo’dan tahmin verilerini çeker ve günlük/saatlik listeler halinde gösterir. API anahtarı gerektirmez.

## ✨ Özellikler
- Open-Meteo’dan **günlük/saatlik** tahminler  
- Maksimum / minimum sıcaklık  
- **weathercode → ikon** eşlemesi ile ☀️/🌧️/❄️  

## 🧰 Teknolojiler
- **Flutter/Dart**  
- **Open-Meteo Forecast API** (ücretsiz, anahtarsız)  

### Yapılandırma (API)
- Open-Meteo günlük/saatlik değişkenleri URL parametreleriyle seçilir.
- Örnek(günlük):
    'https://api.open-meteo.com/v1/forecast?latitude=41.01&longitude=28.97&daily=temperature_2m_max,temperature_2m_min,weathercode&timezone=auto'

### İzinler
- Konum kullanacaksan Android/iOS'ta ilgili location izinlerini ekle.
- Web'de tarayıcı konum iznini test et.
