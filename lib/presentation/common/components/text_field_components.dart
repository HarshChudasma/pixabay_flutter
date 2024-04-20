import 'package:application/presentation/common/components/text_components.dart';
import 'package:application/presentation/common/constants/color_constants.dart';
import 'package:application/presentation/common/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

/// Common Textfield for all project components

class TextFieldComponent extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final String? labelText;
  final bool isPassword;
  final bool isRequired;
  final String? Function(String?)? validator;
  final Function(String _)? onChanged;
  final TextInputType keyboardType;
  final int? maxLength;
  final dynamic suffixIcon;
  final Function()? onSuffixPressed;
  final Widget? prefixWidget;
  final Color fillColor;
  final bool enlargePrfixWidget;
  final Color labelColor;
  final bool readOnly;
  final bool enabled;
  final int? maxLines;
  final VoidCallback? onTap;
  final FocusNode currentFocus;
  final FocusNode? nextFocus;
  final EdgeInsetsGeometry? padding;
  final bool isLabel;
  final TextStyle? hintTextStyle;
  final TextStyle? textStyle;
  final List<TextInputFormatter>? formatter;
  final TextAlign textAlign;
  final Color focusBorderColor;
  final double borderRadius;
  final void Function()? passOnTap;

  TextFieldComponent(
      this.controller, {
        Key? key,
        this.hintText,
        this.labelText,
        this.isPassword = false,
        this.isRequired = false,
        this.validator,
        this.onChanged(String _)?,
        this.keyboardType = TextInputType.text,
        this.maxLength = 45,
        this.suffixIcon,
        this.onSuffixPressed,
        this.prefixWidget,
        this.onTap,
        this.fillColor = AppColors.whiteColor,
        this.enlargePrfixWidget = true,
        this.labelColor = AppColors.charcoalGrey,
        this.readOnly = false,
        this.enabled = true,
        this.maxLines,
        required this.currentFocus,
        this.nextFocus,
        this.padding,
        this.isLabel = true,
        this.hintTextStyle,
        this.textStyle,
        this.formatter,
        this.textAlign = TextAlign.start,
        this.focusBorderColor = AppColors.blackColor,
        this.borderRadius = 6.0,
        this.passOnTap,
      }) : super(key: key);

  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return isLabel
        ? Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _showLabelText(context),
        4.verticalSizedBox,
        Center(child: textField(context)),
      ],
    )
        : textField(context);
  }

  Widget textField(BuildContext context) {
    return TextFormField(
      maxLines: maxLines ?? 1,
      controller: controller,
      readOnly: readOnly,
      focusNode: currentFocus,
      cursorColor: Colors.black,
      // autovalidateMode: AutovalidateMode.onUserInteraction,
      enabled: enabled,
      obscureText: isPassword ? hidePassword : !hidePassword,
      maxLength: maxLength,
      textInputAction: keyboardType == TextInputType.multiline
          ? TextInputAction.newline
          : nextFocus != null
          ? TextInputAction.next
          : TextInputAction.done,
      onTap: onTap,
      onChanged: (_) => onChanged == null ? () {} : onChanged!(_),
      onEditingComplete: () {
        currentFocus.unfocus();
        if (nextFocus != null) {
          nextFocus?.requestFocus();
        }
      },
      style: textStyle ?? context.textTheme.labelSmall?.copyWith(
        fontSize: 16,
      ),
      validator: validator,
      keyboardType: keyboardType,
      inputFormatters: formatter,
      textAlign: textAlign,
      decoration: InputDecoration(
        errorStyle: context.textTheme.labelSmall?.copyWith(
          fontSize: 14,
          color: AppColors.redOrange,
        ),
        counterText: '',
        filled: true,
        errorMaxLines: 2,
        fillColor: fillColor,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: focusBorderColor),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: focusBorderColor),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: focusBorderColor,
          ),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.redOrange),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.redOrange),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        contentPadding: padding ??
            EdgeInsetsDirectional.only(
                start: 16,
                top: 16,
                bottom: 15,
                end: suffixIcon != null ? 0 : 16),
        border: InputBorder.none,
        hintText: hintText ?? '',
        // labelText: widget.labelText,
        // labelStyle: FontStylesConstant.font14(
        //     color: widget.currentFocus.hasFocus
        //         ? ColorConstant.black
        //         : ColorConstant.lightGrey),
        hintStyle: hintTextStyle ?? context.textTheme.labelSmall?.copyWith(
          fontSize: 16.0,
          color: AppColors.lightGrey
        ),
        prefixIcon: prefixWidget != null
            ? SizedBox(
          width: enlargePrfixWidget ? 102 : null,
          child: prefixWidget,
        )
            : null,
        suffixIcon: isPassword
            ? GestureDetector(
          child: hidePassword
              ? const Icon(
            Icons.visibility_off,
            color: AppColors.greyishThree,
          )
              : const Icon(
            Icons.visibility,
            color: AppColors.greyishThree,
          ),
          onTap: passOnTap,
        )
            : suffixIcon != null && onSuffixPressed != null
            ? GestureDetector(
          onTap: onSuffixPressed,
          child: suffixIcon.runtimeType == IconData
              ? Icon(
            suffixIcon,
            color: AppColors.greyishThree,
          )
              : suffixIcon,
        )
            : null,
      ),
    );
  }

  Widget _showLabelText(BuildContext context) {
    if (labelText != null) {
      return Row(
        children: [
          TextComponent(
            labelText!,
            style: context.textTheme.labelSmall?.copyWith(
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
              color: labelColor
            ),
          ),
          TextComponent(
            isRequired ? '*' : '',
            style: context.textTheme.labelSmall?.copyWith(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                color: labelColor
            ),
          ),
        ],
      );
    } else {
      return const SizedBox();
    }
  }
}
