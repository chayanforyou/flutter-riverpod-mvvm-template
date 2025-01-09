import 'package:intl/intl.dart';

extension DateTimeExtensions on DateTime {
  String format(String pattern) {
    return DateFormat(pattern).format(this);
  }

  bool get isToday {
    final now = DateTime.now();
    return year == now.year && month == now.month && day == now.day;
  }
}
