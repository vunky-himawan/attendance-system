Map<String, String> parseDateTime(String dateStr) {
  DateTime dateTime = DateTime.parse(dateStr);

  List<String> monthNames = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "Mei",
    "Jun",
    "Jul",
    "Agus",
    "Sept",
    "Okt",
    "Nov",
    "Des"
  ];

  // List of weekday names in English
  List<String> daysOfWeek = [
    "Minggu",
    "Senin",
    "Selasa",
    "Rabu",
    "Kamis",
    "Jum'at",
    "Sabtu"
  ];

  int day = dateTime.day;
  String monthName = monthNames[dateTime.month - 1];
  String weekday = daysOfWeek[dateTime.weekday % 7];
  int hour = dateTime.hour;
  int minute = dateTime.minute;
  int second = dateTime.second;

  String formattedHour = hour.toString().padLeft(2, '0');
  String formattedMinute = minute.toString().padLeft(2, '0');
  String formattedSecond = second.toString().padLeft(2, '0');

  return {
    'date': day.toString(),
    'month': monthName,
    'weekday': weekday,
    'year': dateTime.year.toString(),
    'time': '$formattedHour:$formattedMinute',
  };
}
