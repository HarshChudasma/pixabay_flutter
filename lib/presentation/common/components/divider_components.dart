import 'package:application/presentation/common/constants/color_constants.dart';
import 'package:flutter/material.dart';

/// Common Divider for all project

class DividerComponent extends StatelessWidget {
  final double height;
  final Color color;
  final double? thickness;

  const DividerComponent({
    Key? key,
    this.height = 1,
    this.color = AppColors.blackTwo6,this.thickness=1,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Divider(color: color, height: 1,thickness: 1,);
  }
}
