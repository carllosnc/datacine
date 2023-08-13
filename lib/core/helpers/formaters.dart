import 'package:intl/intl.dart';

extension StringExtension on String {
  String formatMoney() {
    return "\$$this".replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]},',
    );
  }

  String formatDateTime() {
    if (isEmpty || this == "null") {
      return "Unknown date";
    }

    DateTime dateTime = DateTime.parse(this);

    return DateFormat.yMMMMd('en_US').format(dateTime).toString();
  }

  String formatYear() {
    if (isEmpty || this == "null") {
      return "Unknown date";
    }

    DateTime dateTime = DateTime.parse(this);

    return DateFormat.y('en_US').format(dateTime).toString();
  }

  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}
