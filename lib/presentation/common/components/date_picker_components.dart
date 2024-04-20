import 'package:application/presentation/common/constants/string_constants.dart';
import 'package:flutter/material.dart';

/// Common Components for all

class DatePickerComponent {
  static Future<DateTime?> pickDate({
    required BuildContext context,
    required DateTime initialDate,
    required DateTime firstDate,
    required DateTime lastDate,
    String title = StringConstants.selectDate,
  }) async {
    return await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );
  }

  // static Future<void> pickDateFromSheet({
  //   required BuildContext context,
  //   required dynamic Function(DateTime) selectedDate,
  //   required DateTime initialDate,
  //   required DateTime firstDate,
  //   required DateTime lastDate,
  //   required bool afterLogin,
  //   String screenName = '',
  //   String title = StringConstants.selectDate,
  // }) async {
  //   BottomSheetComponent.showBottomSheet(
  //     context: context,
  //     leadingTitle: title,
  //     body: SelectDateComponent(
  //       selectedDate: selectedDate,
  //       initialDate: initialDate,
  //       minDate: firstDate,
  //       maxDate: lastDate,
  //       afterLogin: afterLogin,
  //     ),
  //     screenName: screenName,
  //   );
  // }
}
