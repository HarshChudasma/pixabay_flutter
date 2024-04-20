import 'package:application/presentation/modules/pixabay_image_detailsscr/pixabay_details_screen.dart';
import 'package:application/presentation/modules/pixabay_screen/pixabay_screen.dart';
import 'package:get/get.dart';
import 'package:application/presentation/modules/splash_screen/splash_screen.dart';
import 'package:application/app/routes/app_routes.dart';

/// This is the app pages for the all screens
class AppPages {

  static List<GetPage> pages = <GetPage>[
    GetPage(name: AppRoutes.splashScreen, page: () => SplashScreen(),),
    GetPage(name: AppRoutes.pixabayScreen, page: () => PixaBayGalleryScreen(),),
    GetPage(name: AppRoutes.pixabayDtlScr, page: () => PixaBayDetailScreen(),),
  ];

}