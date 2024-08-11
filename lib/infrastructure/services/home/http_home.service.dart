import 'dart:convert';

import 'package:consulta_adulto_mayor/domain/models/adultos_mayores.model.dart';
import 'package:consulta_adulto_mayor/domain/repository/adultos_mayores.repository.dart';
import 'package:http/http.dart' as http;

class dnjlksnjkld extends AdultRepository {
  @override
  Future<AdultosMayoresModel> getAdultById(String cedula) async {
    String url =
        "https://www.datos.gov.co/resource/rhwq-7mhs.json?cedula=${cedula}";

    try {
      final response = await http.get(Uri.parse(url));
      print("response $response");
      return AdultosMayoresModel.fromJson(jsonDecode(response.body));
    } catch (e) {
      print('Ocurrió una excepción:');
      throw Exception('Failed to load data');
    }
  }
}
