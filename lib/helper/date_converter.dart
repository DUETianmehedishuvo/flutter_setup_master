import 'package:intl/intl.dart';

class DateConverter {
  static String formatDate(DateTime dateTime) {
    return DateFormat('yyyy-MM-dd hh:mm:ss').format(dateTime);
  }

  static String dateFormatStyle2() {
    String date = DateFormat('d MMMM, yyyy').format(DateTime.now());
    return date ;
  }

  static String estimatedDate(DateTime dateTime) {
    return DateFormat('dd MMMM yyyy').format(dateTime);
  }

  static DateTime convertStringToDatetime(String dateTime) {
    return DateFormat("dd-MMM-yyyy").parse(dateTime);
  }

  static DateTime isoStringToLocalDate(String dateTime) {
    return DateFormat('yyyy-MM-dd HH:mm:ss').parse(dateTime, true).toLocal();
  }

  static String isoStringToLocalTimeOnly(String dateTime) {
    return DateFormat('dd-M-yyyy').format(isoStringToLocalDate(dateTime));
  }

  static String isoStringToLocalDateOnly(String dateTime) {
    return DateFormat('dd:MM:yy').format(isoStringToLocalDate(dateTime));
  }

  static String localDateToIsoString(DateTime dateTime) {
    return DateFormat('dd-MMM-yyyy').format(dateTime.toUtc());
  }

  static String formatDateIOS(String date){
    DateTime dateTime=DateTime.parse(date);
    String dat=DateConverter.localDateToIsoString(dateTime);
    return dat;
  }
}
