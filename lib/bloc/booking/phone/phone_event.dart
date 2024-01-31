part of 'phone_bloc.dart';

@immutable
abstract class PhoneEvent {}

class InitPhoneFieldEvent extends PhoneEvent {}

class EnterDigitEvent extends PhoneEvent {
  final ClientBloc clientBloc;
  final String digit;
  EnterDigitEvent(this.clientBloc, this.digit);
}

class DeleteDigitEvent extends PhoneEvent {
  final ClientBloc clientBloc;
  DeleteDigitEvent(this.clientBloc);
}
