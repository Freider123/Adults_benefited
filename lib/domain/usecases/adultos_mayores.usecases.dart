import 'package:consulta_adulto_mayor/domain/models/adultos_mayores.model.dart';
import 'package:consulta_adulto_mayor/domain/repository/adultos_mayores.repository.dart';

class AdultUsecases {
  final AdultRepository _adultRepository;
  AdultUsecases(this._adultRepository);

  Future<List<AdultosMayoresModel>> getAdultById(String cedula) async {
    return await _adultRepository.getAdultById(cedula);
  }
}
