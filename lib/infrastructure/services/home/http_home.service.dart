import 'dart:convert';
import 'package:consulta_adulto_mayor/domain/models/adultos_mayores.model.dart';
import 'package:consulta_adulto_mayor/domain/repository/adultos_mayores.repository.dart';
import 'package:http/http.dart' as http;

class HttpAdultService extends AdultRepository {
  @override
  Future<List<AdultosMayoresModel>> getAdultById(String cedula) async {
    String url =
        "https://www.datos.gov.co/resource/rhwq-7mhs.json?cedula=${cedula}";

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final List<AdultosMayoresModel> body = jsonDecode(response.body);
        final List<AdultosMayoresModel> dataFinal = body
            .map((dynamic item) => AdultosMayoresModel.fromJson(item))
            .toList();

        return dataFinal;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Ocurrió una excepción: $e');
      throw Exception('Failed to load data');
    }
  }
}