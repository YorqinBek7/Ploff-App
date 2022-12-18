import 'package:intl/intl.dart';

class Helper {
  static String formatSumm(String summ) {
    return NumberFormat.simpleCurrency(locale: "Uz_uz").format(int.parse(summ));
  }
}
