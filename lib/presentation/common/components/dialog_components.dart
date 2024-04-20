import 'package:application/presentation/common/components/text_components.dart';
import 'package:application/presentation/common/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Common Dialog for all project

class AlertDialogComponent {
  static Future showDialogComponent({
    required BuildContext context,
    required Function()? onYesPressed,
    required Function()? onNoPressed,
    String title = 'Are you sure?',
    String secondaryTitle = '',
  }) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return AlertDialog(
          title: TextComponent(
            title,
            style: context.textTheme.labelLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          contentPadding: const EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 24.0),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          content: TextComponent(
            secondaryTitle,
            style: context.textTheme.labelSmall?.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          actions: [
            MaterialButton(
              onPressed: onYesPressed,
              shape: const StadiumBorder(),
              color: context.theme.primaryColor.withOpacity(0.5),
              // passing false
              child: TextComponent(
                'Yes',
                style: context.textTheme.labelSmall
                    ?.copyWith(fontSize: 16, color: AppColors.whiteColor),
              ),
            ),
            MaterialButton(
              onPressed: onNoPressed,
              shape: const StadiumBorder(
                side: BorderSide(
                  color: AppColors.primaryColor,
                ),
              ), // passing true
              child: TextComponent(
                'No',
                style: context.textTheme.labelSmall
                    ?.copyWith(fontSize: 16, color: context.theme.primaryColor),
              ),
            ),
          ],
        );
      },
    );
  }
}
