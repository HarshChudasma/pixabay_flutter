import 'package:application/presentation/common/components/text_components.dart';
import 'package:application/presentation/common/constants/color_constants.dart';
import 'package:application/presentation/common/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Common Radio Button for all project

class RadioButtonComponent extends StatelessWidget {
  final String title;
  final dynamic value;
  final dynamic groupValue;
  final Function(dynamic) onChange;
  const RadioButtonComponent({
    Key? key,
    required this.title,
    required this.value,
    required this.groupValue,
    required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 20,
          height: 20,
          child: Radio(
            value: value,
            groupValue: groupValue,
            onChanged: onChange,
            visualDensity: const VisualDensity(
              vertical: VisualDensity.minimumDensity,
              horizontal: VisualDensity.minimumDensity,
            ),
            materialTapTargetSize:
            MaterialTapTargetSize.shrinkWrap,
            activeColor: AppColors.successColor,
          ),
        ),
        10.horizontalSizedBox,
        TextComponent(
          title,
          style: context.textTheme.labelSmall,
        )
      ],
    );
  }
}
