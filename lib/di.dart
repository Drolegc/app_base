import 'package:get/get.dart';
import 'package:only_sugar_admin/api/base_provider.dart';
import 'shared/services/services.dart';

class DenpendencyInjection {
  static Future<void> init() async {
    final storageService = StorageService();
    await storageService.init();

    Get.put<BaseProvider>(BaseProvider());
    Get.put<StorageService>(storageService);
  }
}
