import 'package:get/get.dart';
import 'package:only_sugar_admin/api/providers/api_auth_provider.dart';
import 'package:only_sugar_admin/models/models.dart';
import 'package:only_sugar_admin/routes/routes.dart';
import 'package:only_sugar_admin/shared/services/services.dart';

class SplashController extends GetxController {

  final ApiAuthProvider _apiAuthProvider;

  SplashController(this._apiAuthProvider);

  Future<void> checkIfUserIsLogged() async {

    await 1.delay();

    StorageService storageService = Get.find<StorageService>();

    print("Checking...");
    if(storageService.token == null)
      return Get.offNamed(Routes.LOGIN);

    // Get user data
    final res = await _apiAuthProvider.me();
    if(res.statusCode != 200)
      return Get.offNamed(Routes.LOGIN);

    User user = User.fromJson(res.body);
    storageService.user = user;

    Get.offNamed(Routes.HOME);

  }
}