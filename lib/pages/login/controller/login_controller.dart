import 'dart:convert';
import 'dart:html';

import 'package:cliinic_v2/config/config.dart' as conf;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

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
  Get.offAllNamed(Routes.getHomeRoute());
}

void sendLoginData(BuildContext context, String user, String password) async {
  /** Response del back */
  var storage = const FlutterSecureStorage();
  String respuesta;
  var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
  var request = http.Request('POST', Uri.parse(conf.baseURL + conf.oauth));
  request.bodyFields = {'usuario': user, 'password': password};
  request.headers.addAll(headers);
  print(request.bodyFields);
  print(request);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    String aux = await response.stream.bytesToString();
    respuesta = proccessResponse(aux);
    print(respuesta);
    storage.write(key: 'id', value: respuesta);
    goToHomeScreen();
  } else {
    print(response.reasonPhrase);
  }
}

String proccessResponse(String body) {
  var jsonResult = jsonDecode(body);
  return jsonResult['id'];
}
