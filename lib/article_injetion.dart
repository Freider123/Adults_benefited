import 'package:consulta_adulto_mayor/domain/repository/adultos_mayores.repository.dart';
import 'package:consulta_adulto_mayor/domain/usecases/adultos_mayores.usecases.dart';
import 'package:consulta_adulto_mayor/infrastructure/services/home/http_home.service.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

initArticlesInjections() {
  sl.registerLazySingleton<AdultUsecases>(
      () => AdultUsecases(sl<AdultRepository>()));
  sl.registerLazySingleton<AdultRepository>(() => HttpAdultService());
}
