import 'package:only_sugar_admin/api/api.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() async {
/*    final appProvider = ApiProvider();
    appProvider.onInit();
    Get.put<ApiRepository>(ApiRepository(apiProvider: appProvider), permanent: true);*/
  }
}
