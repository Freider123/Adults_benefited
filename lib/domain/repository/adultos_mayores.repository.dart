import 'package:consulta_adulto_mayor/domain/models/adultos_mayores.model.dart';

abstract class AdultRepository {
  Future<List<AdultosMayoresModel>> getAdultById(String cedula);
}
