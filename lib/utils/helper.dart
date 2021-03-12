import 'package:intl/intl.dart';

class Helper {
  static String priceFormat(double price) {
    return NumberFormat.currency(locale: 'id', symbol: 'Rp ', decimalDigits: 0)
        .format(price);
  }

  static String dateFormat(DateTime dateTime) {
    return DateFormat('d MMM yyyy').format(dateTime);
  }

  static String dateTimeZoneParser(String dateTime) {
    String date = dateTime.substring(0, 10);
    String time = dateTime.substring(11, 19);
    return '$date $time';
  }

  static String dateParserFormat(String dateTime) {
    DateTime parsed = DateFormat('yyyy-mm-d').parse(dateTime);
    return dateFormat(parsed);
  }
}
