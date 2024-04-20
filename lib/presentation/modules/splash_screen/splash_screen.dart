import 'package:application/presentation/common/components/main_scaffold.dart';
import 'package:application/presentation/common/constants/string_constants.dart';
import 'package:application/presentation/modules/splash_screen/splash_ctrl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  final SplashCtrl c = Get.put(SplashCtrl());

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      widget: Center(
        child: Text(
          StringConstants.splashStr,
          style: context.textTheme.headlineLarge?.copyWith(
            fontSize: 32.0,
          ),
        ),
      ),
    );
  }
}
