import 'package:consulta_adulto_mayor/domain/models/adultos_mayores.model.dart';

abstract class AdultRepository {
  Future<AdultosMayoresModel> getAdultById(String cedula);
}
