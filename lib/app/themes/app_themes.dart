import 'dart:ui';

import 'package:application/presentation/common/constants/color_constants.dart';
import 'package:application/presentation/common/utils/ui_overlay_style_utils.dart';
import 'package:flutter/material.dart';

/// This if for the Theme set for the data
final _AppThemes themes = _AppThemes();

class _AppThemes {
  static final _AppThemes _instance = _AppThemes.internal();

  _AppThemes.internal();

  factory _AppThemes() => _instance;

  static String roboto = 'Roboto';

  ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primaryColor,
    secondaryHeaderColor: AppColors.secondaryColor,
    scaffoldBackgroundColor: AppColors.whiteColor,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.primaryColor,
      onPrimary: AppColors.whiteColor,
      secondary: AppColors.secondaryColor,
      onSecondary: AppColors.blackColor,
      error: AppColors.dangerColor,
      onError: AppColors.dangerColor,
      background: AppColors.whiteColor,
      onBackground: AppColors.whiteColor,
      surface: AppColors.whiteColor,
      onSurface: AppColors.whiteColor,
    ),
    textTheme: TextTheme(
      titleMedium: TextStyle(
        fontFamily: roboto,
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: AppColors.blackColor,
      ),
      titleSmall: TextStyle(
        fontFamily: roboto,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColors.blackColor,
      ),
      titleLarge: TextStyle(
        fontFamily: roboto,
        fontSize: 24,
        fontWeight: FontWeight.w400,
        color: AppColors.blackColor,
      ),
      labelSmall: TextStyle(
        fontFamily: roboto,
        fontSize: 16,
        fontWeight: FontWeight.w300,
        color: AppColors.blackColor,
      ),
      labelMedium: TextStyle(
        fontFamily: roboto,
        fontSize: 20,
        fontWeight: FontWeight.w300,
        color: AppColors.blackColor,
      ),
      labelLarge: TextStyle(
        fontFamily: roboto,
        fontSize: 24,
        fontWeight: FontWeight.w300,
        color: AppColors.blackColor,
      ),
      bodySmall: TextStyle(
        fontFamily: roboto,
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: AppColors.blackColor,
      ),
      bodyMedium: TextStyle(
        fontFamily: roboto,
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: AppColors.blackColor,
      ),
      bodyLarge: TextStyle(
        fontFamily: roboto,
        fontSize: 24,
        fontWeight: FontWeight.w500,
        color: AppColors.blackColor,
      ),
      displaySmall: TextStyle(
        fontFamily: roboto,
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppColors.blackColor,
      ),
      displayMedium: TextStyle(
        fontFamily: roboto,
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppColors.blackColor,
      ),
      displayLarge: TextStyle(
        fontFamily: roboto,
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: AppColors.blackColor,
      ),
      headlineSmall: TextStyle(
        fontFamily: roboto,
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: AppColors.blackColor,
      ),
      headlineMedium: TextStyle(
        fontFamily: roboto,
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: AppColors.blackColor,
      ),
      headlineLarge: TextStyle(
        fontFamily: roboto,
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: AppColors.blackColor,
      ),
    ),
    useMaterial3: true,
    appBarTheme: AppBarTheme(
      systemOverlayStyle: UiOverlayStyleUtil().uiOverlayStyle(),
    ),
  );
}
