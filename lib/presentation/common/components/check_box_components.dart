import 'package:application/presentation/common/components/text_components.dart';
import 'package:application/presentation/common/constants/color_constants.dart';
import 'package:application/presentation/common/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Checkbox components for project

class CheckBoxComponent extends StatelessWidget {
  final String title;
  final dynamic value;
  final Function(dynamic) onChange;

  const CheckBoxComponent({
    Key? key,
    required this.title,
    required this.value,
    required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 20,
          height: 20,
          child: Checkbox(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            visualDensity: const VisualDensity(
              horizontal: VisualDensity.minimumDensity,
              vertical: VisualDensity.minimumDensity,
            ),
            value: value,
            onChanged: onChange,
            activeColor: AppColors.successColor,
          ),
        ),
        10.horizontalSizedBox,
        TextComponent(
          title,
          style: context.textTheme.labelSmall?.copyWith(
            fontSize: 16.0,
          ),
        )
      ],
    );
  }
}
