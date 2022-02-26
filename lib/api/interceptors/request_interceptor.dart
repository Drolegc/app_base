import 'dart:async';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:only_sugar_admin/shared/services/services.dart';

FutureOr<Request> requestInterceptor(Request request) async {
  // final token = StorageService.box.pull(StorageItems.accessToken);

  //var hasModal = request.headers.keys.firstWhere((element) => element == 'noModal', orElse: () => '');
  // if(hasModal == '')
  EasyLoading.show(status: 'Cargando...');
  
  return request;
}
