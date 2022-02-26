import 'package:get/get.dart';
import 'package:only_sugar_admin/modules/home/home_controller.dart';

class HomeBinding implements Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }

}