// part of 'adult_bloc.dart';

// @immutable
// sealed class AdultState {
//   const AdultState(this.adultState);
//   final  adultState;
// }


// final class AdultInitial extends AdultState {
//   const AdultInitial() : super(null);
// }

// //STATUS GET LOAN BY ID
// class LoadingGetLoanByIdState extends AdultState {
//   const LoadingGetLoanByIdState() : super(null);
// }

// class GetLoanByIdSuccessState extends AdultState {
//   final AdultosMayoresModel adultosMayoresModel;

//   GetLoanByIdSuccessState({required this.adultosMayoresModel}): super(null);

//   @override
//   List<Object> get props => [adultosMayoresModel];
// }

// class GetLoanByIdErrorState extends AdultState {
//   final AdultosMayoresModel adultosMayoresModel;

//   GetLoanByIdErrorState({required this.adultosMayoresModel}): super(null);

//   @override
//   List<Object> get props => [adultosMayoresModel];
// }