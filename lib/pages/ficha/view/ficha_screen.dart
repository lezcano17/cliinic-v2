import 'package:cliinic_v2/pages/common/appbar.dart';
import 'package:cliinic_v2/pages/ficha/bloc/ficha_list_bloc.dart';
import 'package:cliinic_v2/pages/ficha/view/ficha_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      body: BlocProvider(
        create: (_) => FichaListBloc()
          ..add(
            FichaListInitEvent(
              listaFicha: objects,
            ),
          ),
        child: BlocBuilder<FichaListBloc, FichaListState>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _DropDownFilter(),
                      _SearchBar(),
                    ],
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.listafichas.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title:
                            Text("Doctor ${state.listafichas[index].DoctorId}"),
                        subtitle: Text(
                            "Paciente ${state.listafichas[index].PacienteId}"),
                        onTap: () {
                          showFicha(context, objects[index]);
                        },
                      );
                    },
                  ),
                ],
              ),
            );
          },
        ),
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

class _DropDownFilter extends StatelessWidget {
  final List<String> options = const [
    "MOTIVO",
    "FECHA",
    "DOCTOR_ID",
    "PACIENTE_ID",
  ];
  const _DropDownFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: options.first,
      items: options.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (value) {},
    );
  }
}

class _SearchBar extends StatelessWidget {
  const _SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.40,
      child: TextFormField(),
    );
  }
}
