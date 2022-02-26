import 'package:get/get.dart';
import 'package:only_sugar_admin/api/providers/providers.dart';
import 'package:only_sugar_admin/models/models.dart';
import 'package:only_sugar_admin/shared/shared.dart';

class LoginController extends GetxController {
  final ApiAuthProvider _apiAuthProvider;

  String? email, password;

  LoginController(this._apiAuthProvider);

  Future<User?> login() async {
    final res = await _apiAuthProvider.login(email!, password!);
    return res.fold((left) => null, (right) {
      final storageService = Get.find<StorageService>();
      storageService.token = right['jwt'];
      storageService.user = right['user'];
      return right['user'];
    });
  }
}
