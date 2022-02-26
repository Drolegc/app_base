import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:only_sugar_admin/modules/login/login.dart';
import 'package:only_sugar_admin/routes/app_pages.dart';
import 'package:only_sugar_admin/shared/constants/colors.dart';
import 'package:only_sugar_admin/shared/shared.dart';
import 'package:only_sugar_admin/shared/widgets/input_text.dart';
import 'package:only_sugar_admin/shared/widgets/responsive_sized_box_width.dart';

class LoginScreen extends GetView<LoginController> {

  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.principalColorLight,
      body: ResponsiveSizedBoxWidth(
        child: Form(
          key: _key,
          child: ListView(
            shrinkWrap: true,
            children: [
              ConstrainedBox(constraints: BoxConstraints(
                maxHeight: Get.height / 2
              ),
              child: Image.asset("assets/img/logo_icon_letra_dorado.png",)),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InputText(
                  label: "Email",
                  onSaved: (val){
                    controller.email = val;
                  },
                  onSubmit: (val) => _onSubmitCallback(),
                  validator: (val) => val.isEmpty ?"Campo requerido" : val.isEmail?null:"Campo requerido",
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InputText(
                  label: "Contraseña",
                  obscureText: true,
                  onSaved: (val){
                    controller.password = val;
                  },
                  onSubmit: (val) => _onSubmitCallback(),
                  validator: (val) => val.isEmpty ? "Campo requerido":null,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CommonWidget.textButton(onPressed: _onSubmitCallback, text:"Iniciar sesion"),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _onSubmitCallback() async {
    if(_key.currentState!.validate()){
      _key.currentState!.save();
      final res = await controller.login();
      if(res != null)
        Get.offNamed(Routes.HOME);

    }
  }
}
