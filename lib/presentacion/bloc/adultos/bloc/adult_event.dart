part of 'adult_bloc.dart';

@immutable
sealed class AdultEvent {}

class GetLoanByIdEvent extends AdultEvent {

  final String id;
    GetLoanByIdEvent(
      this.id
  );
}