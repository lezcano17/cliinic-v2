import 'package:cliinic_v2/pages/common/appbar.dart';
import 'package:cliinic_v2/pages/ficha/view/ficha_controller.dart';
import 'package:flutter/material.dart';

class FichaScreen extends StatefulWidget {
  @override
  _FichaScreenState createState() => _FichaScreenState();
}

class _FichaScreenState extends State<FichaScreen> {
  List<Ficha> objects = [];

  @override
  void initState() {
    super.initState();
    // Fetch objects asynchronously and populate the list
    fetchFichas().then((fetchedObjects) {
      setState(() {
        objects = fetchedObjects;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(),
      body: ListView.builder(
        itemCount: objects.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("Doctor ${objects[index].DoctorId}"),
            subtitle: Text("Paciente ${objects[index].PacienteId}"),
            onTap: () {
              showFicha(context, objects[index]);
            },
          );
        },
      ),
    );
  }
}

class Ficha {
  final String id;
  final String motivo;
  final String diagnostico;
  final String tratamiento;
  final String fecha;
  final String PacienteId;
  final String DoctorId;

  Ficha(
      {required this.id,
      required this.motivo,
      required this.diagnostico,
      required this.fecha,
      required this.tratamiento,
      required this.PacienteId,
      required this.DoctorId});

  factory Ficha.fromJson(Map<String, dynamic> json) {
    return Ficha(
      id: json['id'],
      motivo: json['motivo'],
      diagnostico: json['diagnostico'],
      fecha: json['fecha'],
      tratamiento: json['tratamiento'],
      PacienteId: json['doctorId'],
      DoctorId: json['pacienteId'],
    );
  }
}
