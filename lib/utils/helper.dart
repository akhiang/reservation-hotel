import 'package:intl/intl.dart';

class Helper {
  static String dateFormat(DateTime dateTime) {
    return DateFormat('d MMMM yyyy').format(dateTime);
  }

  static String priceFormat(double price) {
    return NumberFormat.currency(locale: 'id', symbol: 'Rp', decimalDigits: 0)
        .format(price);
  }
}
