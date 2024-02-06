import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../client_bloc/FieldType.dart';
import '../client_bloc/client_bloc.dart';

part 'phone_event.dart';
part 'phone_state.dart';

class PhoneBloc extends Bloc<PhoneEvent, PhoneState> {
  String templatePhoneNumber = '+7 (***) ***-**-**';
  late String changedPhoneNumberTemplate;
  List<String> inputDigits = List.empty(growable: true);
  PhoneBloc() : super(PhoneNumberState('')) {
    on<InitPhoneFieldEvent>((event, emit) {
      if (inputDigits.isNotEmpty) {
        changePhone();
      } else {
        emit(PhoneNumberState(templatePhoneNumber));
      }
    });

    on<EnterDigitEvent>((event, emit) {
      if (inputDigits.length < 10) {
        inputDigits.add(event.digit);
        changedPhoneNumberTemplate = templatePhoneNumber;
        changePhone();
        event.clientBloc.add(ChangeClientInfoEvent(
            fieldType: FieldType.phoneNumber, value: inputDigits));
        emit(PhoneNumberState(changedPhoneNumberTemplate));
      }
    });

    on<DeleteDigitEvent>((event, emit) {
      if (inputDigits.isNotEmpty) {
        inputDigits.removeLast();
        changedPhoneNumberTemplate = templatePhoneNumber;
        changePhone();
        event.clientBloc.add(ChangeClientInfoEvent(
            fieldType: FieldType.phoneNumber, value: inputDigits));
        emit(PhoneNumberState(changedPhoneNumberTemplate));
      } else {
        emit(PhoneNumberState(templatePhoneNumber));
      }
    });
  }

  changePhone() {
    for (var value in inputDigits) {
      changedPhoneNumberTemplate =
          changedPhoneNumberTemplate.replaceFirst('*', value);
    }
  }
}
