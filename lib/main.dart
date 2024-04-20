import 'package:application/app/services/init_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:application/app/themes/app_themes.dart';
import 'package:application/app/routes/app_pages.dart';
import 'package:application/app/routes/app_routes.dart';

void main() async {
  initService.init();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      child: GetMaterialApp(
        title: "Pixabay",
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        theme: themes.lightTheme,
        getPages: AppPages.pages,
        initialRoute: AppRoutes.splashScreen,
      ),
    );
  }
}

