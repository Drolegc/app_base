import 'package:get/get.dart';
import 'api.dart';

class BaseProvider extends GetConnect {
  @override
  void onInit() {
    print("BASE");
    httpClient.baseUrl = ApiConstants.baseUrl;
    httpClient.addAuthenticator(authInterceptor);
    httpClient.addRequestModifier(requestInterceptor);
    httpClient.addResponseModifier(responseInterceptor);
  }

}
