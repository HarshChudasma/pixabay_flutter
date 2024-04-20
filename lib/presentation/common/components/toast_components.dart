import 'package:application/presentation/common/components/text_components.dart';
import 'package:application/presentation/common/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

/// Common Toast message for project

enum ToastType { success, error }

class ToastComponent {
  static void showToast(
    BuildContext context,
    String message, {
    bool makeToastPositionTop = false,
    bool extendDurationTime = false,
    ToastType type = ToastType.success,
    Duration? toastDuration,
  }) {
    final fToast = FToast()..init(context);
    final Widget toast = Padding(
      padding: EdgeInsets.only(
        top: 12,
        left: 24,
        right: 24,
        bottom: makeToastPositionTop ? 12 : 34,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: type == ToastType.success
              ? context.theme.primaryColor
              : AppColors.dangerColor,
        ),
        // width: MediaQuery.of(context).size.width * .9,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Icon(
                  type == ToastType.success ? Icons.info : Icons.error,
                  color: AppColors.whiteColor,
                ),
                const SizedBox(width: 12),
              ],
            ),
            Flexible(
              child: TextComponent(
                message,
                maxLines: 3,
                style: context.textTheme.labelSmall?.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                overFlow: TextOverflow.clip,
              ),
            ),
          ],
        ),
      ),
    );
    fToast.showToast(
      child: toast,
      gravity: makeToastPositionTop ? ToastGravity.TOP : ToastGravity.BOTTOM,
      toastDuration:
          toastDuration ?? Duration(seconds: extendDurationTime ? 5 : 3),
    );
  }
}
