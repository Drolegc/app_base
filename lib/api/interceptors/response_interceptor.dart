import 'dart:async';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:only_sugar_admin/models/models.dart';
import 'package:only_sugar_admin/shared/shared.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';

FutureOr<dynamic> responseInterceptor(
    Request request, Response response) async {
  EasyLoading.dismiss();

  if (response.statusCode != 200) {
    handleErrorStatus(response);
    return response;
  }

  return response;
}

void handleErrorStatus(Response response) {
  switch (response.statusCode) {
    case 400:
      //final message = ErrorResponse.fromJson(response.body);
      CommonWidget.toast("Error");
      break;
    default:
      CommonWidget.toast(response.statusText.toString());
  }

  return;
}
