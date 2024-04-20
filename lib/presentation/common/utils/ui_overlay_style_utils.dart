import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Ui orver lay for project

class UiOverlayStyleUtil {
  SystemUiOverlayStyle uiOverlayStyle({
    Brightness brightness = Brightness.dark,
    Color color = Colors.transparent,
  }) {
    return SystemUiOverlayStyle(
      statusBarColor: color,
      systemNavigationBarColor: color,
      systemNavigationBarDividerColor: color,
      statusBarBrightness: brightness,
      statusBarIconBrightness: brightness,
      systemNavigationBarIconBrightness: brightness,
      systemNavigationBarContrastEnforced: false,
      systemStatusBarContrastEnforced: false,
    );
  }
}
