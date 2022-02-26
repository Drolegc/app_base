import 'package:get/get.dart';
import 'package:only_sugar_admin/models/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService extends GetxService {

  User? user;
  String? _token;

  String? get token => _token;

  void set token(String? t){
    _token = t;
    if(token != null)
    SharedPreferences.getInstance().then((prefs) => prefs.setString("token", t!));
  }

  Future<void> init() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.get("token") as String?;
  }

  Future<void> deletePrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("token");
  }
}
