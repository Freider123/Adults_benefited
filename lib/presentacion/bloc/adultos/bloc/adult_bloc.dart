import 'package:bloc/bloc.dart';
import 'package:consulta_adulto_mayor/domain/models/adultos_mayores.model.dart';
import 'package:consulta_adulto_mayor/domain/usecases/adultos_mayores.usecases.dart';
import 'package:meta/meta.dart';

part 'adult_event.dart';
part 'adult_state.dart';

class AdultBloc extends Bloc<AdultEvent, AdultState> {

  final AdultUsecases _adultUsecases;

  AdultBloc(this._adultUsecases) : super(AdultInitial()) {
    on<GetLoanByIdEvent>(_getLoanById);
  }

  void _getLoanById(GetLoanByIdEvent event, Emitter<AdultState> emit) async {
    String id = event.id;
    final List<AdultosMayoresModel> response = await _adultUsecases.getAdultById(id);
    if (response.isNotEmpty) {
      emit(GetAdultByIdSuccessState (responsePages: response));
    } else {}
  }
}
