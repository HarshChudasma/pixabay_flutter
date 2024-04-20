import 'package:application/app/constants/date_time_format_constants.dart';
import 'package:intl/intl.dart';

/// Date Time Util
class DateTimeUtil {

  String timeStampToFormattedDate(int timeStamp) {
    try {
      final DateTime dateTime =
      DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000).toUtc();
      String formattedDate = DateFormat('dd MMM hh:mm a').format(dateTime);
      return formattedDate;
    } catch (e) {
      return '';
    }
  }

  String formatDate({
    required DateTime dateTime,
    String dateFormat = DateTimeFormatConstant.dd_MMM_yyy,
  }) {
    try {
      String formattedDate = DateFormat(dateFormat).format(dateTime);
      return formattedDate;
    } catch (e) {
      return '';
    }
  }

  String formatStringDate({
    required String dateTime,
    String dateFormat = DateTimeFormatConstant.dd_MMM_yyy,
  }) {
    try {
      DateTime parseDate = DateTime.parse(dateTime);
      String formattedDate = DateFormat(dateFormat).format(parseDate);
      return formattedDate;
    } catch (e) {
      return '';
    }
  }

  String formatTime({
    required DateTime dateTime,
    String timeFormat = DateTimeFormatConstant.hh_mm_a,
  }) {
    try {
      String formattedDate = DateFormat(timeFormat).format(dateTime);
      return formattedDate;
    } catch (e) {
      return '';
    }
  }

  String formatTimeString({
    required String dateTime,
    String timeFormat = DateTimeFormatConstant.hh_mm_aa,
  }) {
    try {
      DateTime parseDate = DateTime.parse(dateTime);
      String formattedDate = DateFormat(timeFormat).format(parseDate);
      return formattedDate;
    } catch (e) {
      return '';
    }
  }

  String formatDateAndTime(
      String dateTime, {
        String format = 'yyyy-MM-dd h:mm:ss',
        String outPutFormat = 'MMM dd, yyyy',
      }) {
    try {
      DateTime parseDate = DateFormat(format).parse(dateTime);
      var inputDate = DateTime.parse(parseDate.toString());
      var outputFormat = DateFormat(outPutFormat);
      var outputDate = outputFormat.format(inputDate);
      return outputDate;
    } catch (e) {
      return dateTime;
    }
  }

  // String formatTimeOfDay(Timestamp timestamp) {
  //   final dateTime =
  //   DateTime.fromMillisecondsSinceEpoch(timestamp.millisecondsSinceEpoch);
  //   final format = DateFormat('h:mm a');
  //   return format.format(dateTime);
  // }
  //
  // String formatDateTimeOfDay(Timestamp timestamp) {
  //   final lastMessageTime =
  //   DateTime.fromMillisecondsSinceEpoch(timestamp.millisecondsSinceEpoch);
  //   final now = DateTime.now();
  //   final difference = now.difference(lastMessageTime);
  //   String formattedTime;
  //
  //   if (difference.inDays >= 1 && difference.inDays < 2) {
  //     final timeFormat = DateFormat('hh:mm aaa');
  //     formattedTime = 'Yesterday ${timeFormat.format(lastMessageTime)}';
  //   }
  //   if (difference.inDays >= 2 && difference.inDays < 7) {
  //     final dayFormat = DateFormat('EEEE hh:mm aaa');
  //     formattedTime = dayFormat.format(lastMessageTime);
  //   } else if (difference.inDays >= 7) {
  //     final dateFormat = DateFormat('dd MMM, yyyy hh:mm aaa');
  //     formattedTime = dateFormat.format(lastMessageTime);
  //   } else {
  //     final timeFormat = DateFormat('hh:mm aaa');
  //     formattedTime = 'Today ${timeFormat.format(lastMessageTime)}';
  //   }
  //   return formattedTime;
  // }

}
