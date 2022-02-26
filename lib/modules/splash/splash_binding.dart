import 'package:get/get.dart';
import 'package:only_sugar_admin/api/providers/api_auth_provider.dart';
import 'package:only_sugar_admin/modules/splash/splash_controller.dart';

class SplashBinding implements Bindings {

  @override
  void dependencies() {
    final ApiAuthProvider apiAuthProvider = ApiAuthProvider(Get.find());
    final controller = SplashController(apiAuthProvider);
    controller.checkIfUserIsLogged();
   Get.lazyPut(() => controller);
  }
}