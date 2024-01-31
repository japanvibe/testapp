part of 'phone_bloc.dart';

@immutable
abstract class PhoneState {}

class PhoneInitial extends PhoneState {}

class PhoneNumberState extends PhoneState {
  final String phoneNumber;
  PhoneNumberState(this.phoneNumber);
}
