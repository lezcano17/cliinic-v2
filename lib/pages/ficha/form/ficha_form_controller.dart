import 'dart:convert';
import 'dart:html';

import 'package:cliinic_v2/config/config.dart' as conf;
import 'package:cliinic_v2/models/paciente.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

Future<String> fetchPacientes() async {
  /** Response del back */
  // var storage = const FlutterSecureStorage();
  var respuesta;
  var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
  // var request = http.Request(
  //     'GET', Uri.parse('http://localhost:8080/api/fichaConsulta/'));
  // print(request);

  // http.StreamedResponse response = await request.send();

  String apiURL = conf.baseURL + conf.paciente;
  final url = Uri.parse(apiURL);
  print(url);
  final request = http.Request('GET', url);
  request.headers.addAll(headers);
  request.bodyFields = {};

  final response = await http.get(url, headers: headers);

  if (response.statusCode == 200) {
    // print(await response.stream.bytesToString());
    String aux = response.body;
    // print(aux);
    return aux;
  } else {
    print(response.reasonPhrase);
    return "";
  }
}

List<Paciente> procesarPacientesResponse(String respuesta) {
  var jsonResult = jsonDecode(respuesta);
  late List<Paciente> listaPaciente = List.empty(growable: true);
  for (var element in jsonResult) {
    Paciente aux = Paciente(
        id: element['id'],
        nombre: element['nombre'],
        apellido: element['apellido'],
        ci: element['ci'],
        email: element['email'],
        telefono: element['telefono'],
        fechaNacimiento: element['fechaNacimiento'],
        createdAt: element['createdAt'],
        updatedAt: element['updatedAt']);
    listaPaciente.add(aux);
  }
  return listaPaciente;
}
