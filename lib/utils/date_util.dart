import 'package:intl/intl.dart';

class DateUtil {
  DateUtil._();

  static String formatDateTime(String? dateTimeString) {
    if (dateTimeString == null) return 'N/A';

    DateTime dateTime = DateTime.parse(dateTimeString);
    final DateFormat outputFormat = DateFormat("yyyy-MM-dd 'at' hh:mm a");
    return outputFormat.format(dateTime);
  }
}
