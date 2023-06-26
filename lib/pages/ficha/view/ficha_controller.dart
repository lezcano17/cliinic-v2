import 'dart:convert';
import 'dart:html';

import 'package:cliinic_v2/config/config.dart' as conf;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'ficha_screen.dart';

Future<List<Ficha>> fetchFichas() async {
  /** Response del back */
  // var storage = const FlutterSecureStorage();
  var respuesta;
  var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
  // var request = http.Request(
  //     'GET', Uri.parse('http://localhost:8080/api/fichaConsulta/'));
  // print(request);

  // http.StreamedResponse response = await request.send();

  String apiURL = conf.baseURL + conf.ficha;
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
    respuesta = procesarFicha(aux);
    return respuesta;
  } else {
    print(response.reasonPhrase);
    return respuesta;
  }
}

void showFicha(BuildContext context, Ficha ficha) {
  _showMyDialog(context, ficha);
}

List<Ficha> procesarFicha(String respuesta) {
  var jsonResult = jsonDecode(respuesta);
  late List<Ficha> listaFichas = List.empty(growable: true);
  for (var element in jsonResult) {
    Ficha aux = Ficha(
        id: element['id'],
        motivo: element['motivo'],
        diagnostico: element['diagnostico'],
        fecha: element['fecha'],
        tratamiento: element['tratamiento'],
        DoctorId: element['DoctorId'],
        PacienteId: element['PacienteId']);
    listaFichas.add(aux);
  }
  return listaFichas;
}

Future<void> _showMyDialog(BuildContext context, Ficha ficha) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Ficha'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text("Doctor " + ficha.DoctorId),
              Text("Paciente " + ficha.PacienteId),
              Text("Motivo: " + ficha.motivo),
              Text("Diagnóstico: " + ficha.diagnostico),
              Text("Tratamiento: " + ficha.tratamiento),
              Text("Fecha: " + ficha.fecha)
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Approve'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
