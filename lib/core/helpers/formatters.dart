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

    try {
      DateTime? dateTime = DateTime.tryParse(this);
      if (dateTime != null) {
        return DateFormat.yMMMMd('en_US').format(dateTime);
      }
    } catch (_) {}

    return this;
  }

  String formatYear() {
    if (isEmpty || this == "null") {
      return "—";
    }

    try {
      DateTime? dateTime = DateTime.tryParse(this);
      if (dateTime != null) {
        return DateFormat.y('en_US').format(dateTime);
      }
      if (length >= 4 && int.tryParse(substring(0, 4)) != null) {
        return substring(0, 4);
      }
    } catch (_) {}

    return "—";
  }

  String capitalize() {
    if (isEmpty) return this;
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}
