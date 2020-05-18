import 'dart:core';

class CalendarUtils {
  static const List<String> months = const [
    'jan',
    'feb',
    'mar',
    'apr',
    'may',
    'jun',
    'jul',
    'aug',
    'sept',
    'oct',
    'nov',
    'dec',
  ];

  static const List<String> weekdays = const [
    'sun',
    'mon',
    'tue',
    'wed',
    'thu',
    'fri',
    'sat',
  ];

  int priorDays = 0;
  int postDays = 0;

  List<int> calendarDays(int year, int month) {
    DateTime first = DateTime(year, month);
    int firstDay = first.subtract(Duration(days: first.weekday)).day;
    int lastEndDay =
        month != 1 ? getLastDay(year, month - 1) : getLastDay(year - 1, 12);
    int endDay = getLastDay(year, month);

    List<int> days = List<int>();

    for (int i = firstDay; i <= lastEndDay; i++) {
      priorDays++;
      days.add(i);
    }

    if (priorDays >= 7) {
      days = List<int>();
      priorDays = 0;
    }

    for (int i = 1; i <= endDay; i++) {
      days.add(i);
    }

    for (int i = 1; days.length < 35; i++) {
      days.add(i);
      postDays++;
    }

    return days;
  }
  

  static int getLastDay(int year, int month) {
    DateTime day = month < 12
        ? new DateTime(year, month + 1, 1)
        : DateTime(year + 1, 1, 1);
    return day.subtract(Duration(days: 1)).day;
  }
}
