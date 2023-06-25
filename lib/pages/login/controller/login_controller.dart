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
  print('Pin correcto!!');
  Get.offAllNamed(Routes.getHomeRoute());
}

void sendLoginData(BuildContext context, String user, String password) async {
  /** Response del back */
  var storage = const FlutterSecureStorage();
  var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
  var request =
      http.Request('GET', Uri.parse('http://localhost:8080/api/login/'));
  request.bodyFields = {'usuario': user, 'password': password};
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
    goToHomeScreen();
  } else {
    print(response.reasonPhrase);
  }
}

// void sendLoginData(BuildContext context, String user, String password) {
//   /** Response del back */
//   var storage = const FlutterSecureStorage();
//   String apiUrl = conf.baseURL + conf.oauth;

//   // Create a Map of the login data
//   Map<String, String> requestHeaders = {
//     'Content-Type': 'application/x-www-form-urlencoded'
//   };
//   Map<String, String> loginData = {
//     'usuario': user,
//     'password': password,
//   };

//   // Encode the login data as JSON
//   final url = Uri.parse(apiUrl);
//   final request = http.Request('POST', url);
//   request.headers.addAll(requestHeaders);
//   request.bodyFields = loginData;

//   // Send the login request to the backend using the http package
//   http
//       .post(Uri.parse(apiUrl),
//           headers: request.headers, body: request.bodyFields)
//       .then((response) async {
//     if (response.statusCode == 200) {
//       // Login successful
//       // TODO: Handle the response from the backend
//       await storage.write(
//           key: 'token', value: json.decode(response.body)["access_token"]);
//       var aux = await storage.read(key: 'token');
//       print(aux);
//       print(response.body);
//       goToHomeScreen();
//     } else {
//       // Login failed
//       // TODO: Handle the error response from the backend
//       print('Error: ${response.statusCode}');
//     }
//   }).catchError((error) {
//     // Login failed due to an exception
//     // TODO: Handle the error
//     print('Error: $error');
//   });
//   goToHomeScreen();
// }



