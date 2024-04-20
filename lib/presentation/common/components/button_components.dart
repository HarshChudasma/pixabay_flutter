import 'package:application/presentation/common/components/svg_components.dart';
import 'package:application/presentation/common/components/text_components.dart';
import 'package:application/presentation/common/constants/color_constants.dart';
import 'package:application/presentation/common/constants/presentation_constants.dart';
import 'package:application/presentation/common/utils/size_utils.dart';
import 'package:flutter/material.dart';

/// Common button component for project

class ButtonComponent extends StatelessWidget {
  final String btnText;
  final Function()? onBtnPressed;
  final Color btnColor;
  final bool invertBtnColor;
  final bool minimizeSize;
  final String? prefixIcon;
  final String? postfixIcon;
  final Color btnTextColor;
  final List<BoxShadow>? boxShadow;
  final TextStyle? buttonTextStyle;
  final EdgeInsets padding;
  final double borderRadius;
  const ButtonComponent(
      this.btnText, {
        Key? key,
        this.onBtnPressed,
        this.btnColor = AppColors.primaryColor,
        this.invertBtnColor = false,
        this.minimizeSize = false,
        this.prefixIcon,
        this.postfixIcon,
        this.btnTextColor = AppColors.whiteColor,
        this.boxShadow,
        this.buttonTextStyle,
        this.padding = const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 30,
        ),
        this.borderRadius = 40,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BorderRadius _borderRadius() => BorderRadius.circular(borderRadius);
    return InkWell(
      onTap: onBtnPressed,
      splashColor: AppColors.greyishThree,
      borderRadius: _borderRadius(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: padding,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius),
              color: onBtnPressed == null
                  ? AppColors.disable
                  : invertBtnColor
                  ? btnColor.withOpacity(PresentationConstant.btnOpacity)
                  : btnColor,
              boxShadow: boxShadow,
            ),
            alignment: minimizeSize ? null : Alignment.center,
            child: Row(
              mainAxisAlignment: _getRowMainAxistAlignment(),
              children: [
                _getPrefixIcon(),
                TextComponent(
                  btnText,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: buttonTextStyle?.copyWith(
                      color: onBtnPressed == null
                          ? btnTextColor.withOpacity(0.8)
                          : btnTextColor) ??
                      TextStyle(
                        fontSize: 24,
                        color: btnTextColor,
                      ),
                ),
                _getPostfixIcon(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _getPrefixIcon() {
    return prefixIcon != null
        ? SvgIconComponent(
      icon: prefixIcon!,
    )
        : 4.verticalSizedBox;
  }

  Widget _getPostfixIcon() {
    return postfixIcon != null
        ? SvgIconComponent(icon: postfixIcon!)
        : 4.verticalSizedBox;
  }

  MainAxisAlignment _getRowMainAxistAlignment() {
    if (postfixIcon != null || prefixIcon != null) {
      return MainAxisAlignment.spaceBetween;
    } else {
      return MainAxisAlignment.center;
    }
  }
}
