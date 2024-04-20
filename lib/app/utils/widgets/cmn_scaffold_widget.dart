import 'package:application/presentation/common/constants/color_constants.dart';
import 'package:flutter/material.dart';

class CmnScaffoldWidget extends StatelessWidget {
  final Widget child;
  CmnScaffoldWidget({Key? key,required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      extendBody: true,
      resizeToAvoidBottomInset: true,
      body: child,

    );
  }
}
