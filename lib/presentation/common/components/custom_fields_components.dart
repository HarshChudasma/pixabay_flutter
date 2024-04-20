import 'package:application/presentation/common/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Custom field for project

class CustomField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final double borderRadius;
  final EdgeInsetsGeometry padding;
  final List<BoxShadow>? boxShadow;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final Color cursorColor;
  final int maxLines;
  final double fontSize;
  final double? width;
  final bool obscureText;
  const CustomField({
    super.key,
    this.controller,
    this.hintText,
    this.textInputAction,
    this.keyboardType,
    this.inputFormatters,
    this.borderRadius = 40,
    this.padding = const EdgeInsets.symmetric(horizontal: 14),
    this.boxShadow,
    this.textStyle,
    this.hintStyle,
    this.cursorColor = AppColors.primaryColor,
    this.fontSize = 20,
    this.maxLines = 1,
    this.width,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 0.75.sw,
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: AppColors.whiteColor,
        boxShadow: boxShadow ??
            [
              BoxShadow(
                color: AppColors.greyColor.withOpacity(0.2),
                blurRadius: 2,
                offset: const Offset(0, 5),
              ),
            ],
      ),
      child: TextField(
        controller: controller,
        textInputAction: textInputAction,
        keyboardType: keyboardType,
        obscureText: obscureText,
        maxLines: maxLines,
        inputFormatters: inputFormatters,
        style: textStyle ??
            TextStyle(
              color: AppColors.blackColor,
              fontSize: fontSize,
            ),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: hintStyle ??
              TextStyle(
                color: AppColors.greyColor,
                fontSize: fontSize,
              ),
        ),
      ),
    );
  }
}
