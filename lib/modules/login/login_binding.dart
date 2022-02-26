import 'package:get/get.dart';
import 'package:only_sugar_admin/api/providers/api_auth_provider.dart';
import 'package:only_sugar_admin/modules/login/login.dart';

class LoginBinding implements Bindings {

  @override
  void dependencies() {
    final ApiAuthProvider apiAuthProvider = ApiAuthProvider(Get.find());
    Get.lazyPut(() => LoginController(apiAuthProvider));
  }

}