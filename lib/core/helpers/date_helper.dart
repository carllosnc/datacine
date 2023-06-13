import 'package:intl/intl.dart';

class DateHelper {
  static String format(String? date) {
    if (date == null || date.isEmpty) {
      return "No date";
    }

    DateTime dateTime = DateTime.parse(date);

    return DateFormat.yMMMMd('en_US').format(dateTime).toString();
  }
}
