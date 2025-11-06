class DailySnapshot {
  final DateTime time;
  final double temp;
  DailySnapshot(this.time, this.temp);
}

// times: List<String>  (hourly.time)
// temps: List<num>     (hourly.temperature_2m)
List<DailySnapshot> pickSnapshots(
  List<dynamic> times,
  List<dynamic> temps, {
  List<int> targetHours = const [12], // istediğin saatler
}) {
  final out = <DailySnapshot>[];
  for (int i = 0; i < times.length; i++) {
    final dt = DateTime.parse(times[i] as String);
    if (targetHours.contains(dt.hour)) {
      out.add(DailySnapshot(dt, (temps[i] as num).toDouble()));
    }
  }
  // sadece 7 güne düşür (günde 2 saat seçtiysen 14 eleman olur)
  return out;
}
