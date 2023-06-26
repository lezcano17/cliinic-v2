// To parse this JSON data, do
//
//     final paciente = pacienteFromJson(jsonString);

import 'dart:convert';

class Paciente {
  String id;
  String nombre;
  String apellido;
  int ci;
  String email;
  int telefono;
  String? fechaNacimiento;
  String? createdAt;
  String? updatedAt;

  Paciente({
    required this.id,
    required this.nombre,
    required this.apellido,
    required this.ci,
    required this.email,
    required this.telefono,
    this.fechaNacimiento,
    this.createdAt,
    this.updatedAt,
  });

  factory Paciente.fromRawJson(String str) =>
      Paciente.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Paciente.fromJson(Map<String, dynamic> json) => Paciente(
        id: json["id"],
        nombre: json["nombre"],
        apellido: json["apellido"],
        ci: json["ci"],
        email: json["email"],
        telefono: json["telefono"],
        fechaNacimiento: json["fecha_nacimiento"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "apellido": apellido,
        "ci": ci,
        "email": email,
        "telefono": telefono,
        "fecha_nacimiento": fechaNacimiento,
        "createdAt": createdAt,
        "updatedAt": updatedAt
      };
}
