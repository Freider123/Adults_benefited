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
        final List<dynamic> data = jsonDecode(response.body);

        // Asegurarse de mapear cada item al modelo adecuado y convertirlo a una lista.
        final List<AdultosMayoresModel> adultosMayoresModel = data
            .map((item) =>
                AdultosMayoresModel.fromJson(item as Map<String, dynamic>))
            .toList();
        print("adultosMayoresModel ${adultosMayoresModel}");

        return adultosMayoresModel;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Ocurrió una excepción: $e');
      throw Exception('Failed to load data');
    }
  }
}
