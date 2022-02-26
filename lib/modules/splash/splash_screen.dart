import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:only_sugar_admin/modules/splash/splash.dart';

class SplashScreen extends GetView<SplashController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
