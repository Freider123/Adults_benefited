import 'dart:convert';

import 'package:consulta_adulto_mayor/domain/models/adultos_mayores.model.dart';
import 'package:consulta_adulto_mayor/domain/repository/adultos_mayores.repository.dart';
import 'package:http/http.dart' as http;

class httpAdultService extends AdultRepository {
  @override
  Future<List<AdultosMayoresModel>> getAdultById(String cedula) async {
    String url =
        "https://www.datos.gov.co/resource/rhwq-7mhs.json?cedula=${cedula}";

    try {
      final response = await http.get(Uri.parse(url));
      final body = jsonDecode(response.body);
      final AdultosMayoresModel dataResponde =
          AdultosMayoresModel.fromJson(body);
      if (dataResponde.cedula.isNotEmpty) {
        final List<AdultosMayoresModel> datafinal =
            dataResponde as List<AdultosMayoresModel>;
        return datafinal;
      }
      return [];
    } catch (e) {
      print('Ocurrió una excepción:');
      throw Exception('Failed to load data');
    }
  }
}
