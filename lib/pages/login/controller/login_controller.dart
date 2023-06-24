import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/routes.dart';

Widget buildTextField(TextEditingController controller, String labelText) {
  return TextField(
    controller: controller,
    decoration: InputDecoration(
      labelText: labelText,
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
  );
}

void goToHomeScreen() {
  print('Pin correcto!!');
  Get.offAllNamed(Routes.getHomeRoute());
}

void sendLoginData(BuildContext context, String user, String password) {
  /** Response del back */

  goToHomeScreen();
}
