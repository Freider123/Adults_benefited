// To parse this JSON data, do
//
//     final adultosMayoresModel = adultosMayoresModelFromJson(jsonString);

import 'dart:convert';

List<AdultosMayoresModel> adultosMayoresModelFromJson(String str) =>
    List<AdultosMayoresModel>.from(
        json.decode(str).map((x) => AdultosMayoresModel.fromJson(x)));

String adultosMayoresModelToJson(List<AdultosMayoresModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AdultosMayoresModel {
  String cedula;
  String primernombre;
  String segundonombre;
  String primerapellido;
  String segundoapellido;

  AdultosMayoresModel({
    required this.cedula,
    required this.primernombre,
    required this.segundonombre,
    required this.primerapellido,
    required this.segundoapellido,
  });

  AdultosMayoresModel copyWith({
    String? cedula,
    String? primernombre,
    String? segundonombre,
    String? primerapellido,
    String? segundoapellido,
  }) =>
      AdultosMayoresModel(
        cedula: cedula ?? this.cedula,
        primernombre: primernombre ?? this.primernombre,
        segundonombre: segundonombre ?? this.segundonombre,
        primerapellido: primerapellido ?? this.primerapellido,
        segundoapellido: segundoapellido ?? this.segundoapellido,
      );

  factory AdultosMayoresModel.fromJson(Map<String, dynamic> json) =>
      AdultosMayoresModel(
        cedula: json["cedula"],
        primernombre: json["primernombre"],
        segundonombre: json["segundonombre"],
        primerapellido: json["primerapellido"],
        segundoapellido: json["segundoapellido"],
      );

  Map<String, dynamic> toJson() => {
        "cedula": cedula,
        "primernombre": primernombre,
        "segundonombre": segundonombre,
        "primerapellido": primerapellido,
        "segundoapellido": segundoapellido,
      };
}
