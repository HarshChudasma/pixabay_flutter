import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart' as size;

// size utils extension for project

extension DoubleExtension on num {
  double get flexibleHeight => size.ScreenUtil().setHeight(this);
  double get flexibleWidth => size.ScreenUtil().setWidth(this);
  double get fontSize => size.ScreenUtil().setSp(this);

  /// Use to add horizontal space
  SizedBox get horizontalSizedBox => SizedBox(width: flexibleWidth);

  // Use to add vertical space
  SizedBox get verticalSizedBox => SizedBox(height: flexibleHeight);
}