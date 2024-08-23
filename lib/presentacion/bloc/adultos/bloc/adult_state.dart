part of 'adult_bloc.dart';

@immutable
sealed class AdultState {
  const AdultState(this.adultState);
  final  adultState;
}

final class AdultInitial extends AdultState {
  const AdultInitial(): super(null);

}

//STATUS GET LOAN BY ID
class LoadingGetLoanByIdState extends AdultState {
  const LoadingGetLoanByIdState() : super(null);
}

class GetAdultByIdSuccessState extends AdultState {
  final List<AdultosMayoresModel> responsePages;

  const GetAdultByIdSuccessState({required this.responsePages}): super(null);

  List<Object> get props => [responsePages];
}

class GetAdultByIdErrorState extends AdultState {
  final List<AdultosMayoresModel> responsePages;

  const GetAdultByIdErrorState({required this.responsePages}): super(null);

  List<Object> get props => [responsePages];
}
