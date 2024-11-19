import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class Utils {
  static String formatDate(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }

  static String dateStringFormat({required date}) {
    initializeDateFormatting();
    return DateFormat('MM월 dd일', 'ko_KR').format(date);
  }
}
