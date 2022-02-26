
import 'package:get/get.dart';
import 'package:only_sugar_admin/modules/home/home.dart';
import 'package:only_sugar_admin/modules/login/login.dart';
import 'package:only_sugar_admin/modules/splash/splash.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH;

  static final routes = [

    GetPage(
      name: Routes.LOGIN,
      page: () => LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
        name: Routes.HOME,
        page: () => HomeScreen(),
        binding: HomeBinding()),
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashScreen(),
      binding: SplashBinding()
    )
  ];
}
