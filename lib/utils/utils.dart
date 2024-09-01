import 'package:intl/intl.dart';

class Utils {
  static String formatDate(DateTime date) {
    return DateFormat('yyyy.MM.dd').format(date);
  }
}
