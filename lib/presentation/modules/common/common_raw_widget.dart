import 'package:application/presentation/common/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonRawWidget extends StatelessWidget {
  const CommonRawWidget({Key? key,required this.icon, required this.num, this.color,this.fontClr}) : super(key: key);

  final IconData icon;
  final String num;
  final Color? color;
  final Color? fontClr;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 20.0,
          color: color ?? context.theme.primaryColor,
        ),
        const SizedBox(width: 4),
        Text(num,style: context.textTheme.labelSmall?.copyWith(
            fontSize: 12.0,
            color:  fontClr ?? AppColors.whiteColor
        )),
      ],
    );
  }
}
