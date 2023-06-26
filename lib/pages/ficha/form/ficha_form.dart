import 'package:cliinic_v2/models/paciente.dart';
import 'package:cliinic_v2/pages/common/appbar.dart';
import 'package:flutter/material.dart';

import 'ficha_form_controller.dart';

class FichaFormScreen extends StatefulWidget {
  @override
  _FichaFormScreenState createState() => _FichaFormScreenState();
}

class _FichaFormScreenState extends State<FichaFormScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  DateTime selectedDate = DateTime.now();
  String selectedPacienteState = '';
  String motivoConsulta = '';
  String diagnostico = '';
  String tratamiento = '';

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  Future<void> _selectPaciente(BuildContext context) async {
    final respuesta = await fetchPacientes();
    List<Paciente> pacientes = procesarPacientesResponse(respuesta);
    print(pacientes.length);

    Paciente? selectedPaciente = await showDialog<Paciente>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text('Selecciona Paciente'),
          children: pacientes.map((paciente) {
            return SimpleDialogOption(
              onPressed: () {
                Navigator.of(context).pop(paciente);
              },
              child: Text(paciente.nombre),
            );
          }).toList(),
        );
      },
    );

    if (selectedPaciente != null) {
      setState(() {
        selectedPacienteState = selectedPaciente.id;
        print(selectedPacienteState);
      });
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // TODO: Process the form data (fecha, selectedPaciente, motivoConsulta, diagnostico, tratamiento)
      // Example:
      // final formData = {
      //   'fecha': selectedDate,
      //   'paciente': selectedPaciente,
      //   'motivoConsulta': motivoConsulta,
      //   'diagnostico': diagnostico,
      //   'tratamiento': tratamiento,
      // };
      // sendFormData(formData);

      // Placeholder code to demonstrate the functionality
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Form Data'),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Fecha: $selectedDate'),
                Text('Paciente: $selectedPacienteState'),
                Text('Motivo de Consulta: $motivoConsulta'),
                Text('Diagnóstico: $diagnostico'),
                Text('Tratamiento: $tratamiento'),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Fecha',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              InkWell(
                onTap: () {
                  _selectDate(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${selectedDate.toLocal()}'.split(' ')[0],
                        style: TextStyle(fontSize: 18),
                      ),
                      Icon(Icons.calendar_today),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 32),
              Text(
                'Selecciona Paciente',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  _selectPaciente(context);
                },
                child: Text('Seleccionar Paciente'),
              ),
              SizedBox(height: 32),
              Text(
                'Detalle de consulta',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Texto del motivo de consulta',
                  border: OutlineInputBorder(),
                ),
                onSaved: (value) {
                  motivoConsulta = value!;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the motivo de consulta';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Diagnóstico',
                  border: OutlineInputBorder(),
                ),
                onSaved: (value) {
                  diagnostico = value!;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the diagnóstico';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Tratamiento',
                  border: OutlineInputBorder(),
                ),
                onSaved: (value) {
                  tratamiento = value!;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the tratamiento';
                  }
                  return null;
                },
              ),
              SizedBox(height: 32),
              Center(
                child: ElevatedButton(
                  onPressed: _submitForm,
                  child: Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
