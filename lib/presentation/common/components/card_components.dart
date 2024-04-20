import 'package:application/presentation/common/constants/color_constants.dart';
import 'package:flutter/material.dart';

/// Card Components for all project
///

class CardComponent extends StatelessWidget {
  final Widget child;
  final double? width;
  final EdgeInsets? padding;
  final VoidCallback? onTap;
  const CardComponent({
    Key? key,
    required this.child,
    this.padding,
    this.onTap,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding,
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: AppColors.greyColor.withOpacity(0.2),
              offset: const Offset(0, 0),
              blurRadius: 2,
            ),
            BoxShadow(
              color: AppColors.greyColor.withOpacity(0.12),
              offset: const Offset(0, 12),
              blurRadius: 24,
              spreadRadius: -4,
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}
