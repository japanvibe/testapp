import 'package:bloc/bloc.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';

import 'FieldType.dart';

part 'client_event.dart';
part 'client_state.dart';

class ClientBloc extends Bloc<ClientEvent, ClientState> {
  ClientData clientData = ClientData();
  ClientBloc() : super(ClientInfoState(ClientData())) {
    on<ChangeClientInfoEvent>((event, emit) {
      changeClientInfo(event);
      emit(ClientInfoState(clientData));
    });

    on<ChangeTouristInfoEvent>((event, emit) {
      changeTouristsInfo(event);
      emit(ClientInfoState(clientData));
    });

    on<CheckPhoneEvent>((event, emit) {
      if (clientData.phoneNumber.isNotEmpty) {
        validatePhoneNumber();
        emit(ClientInfoState(clientData));
      }
    });

    on<CheckEmailEvent>((event, emit) {
      if (clientData.email.isNotEmpty) {
        validateEmail();
        emit(ClientInfoState(clientData));
      }
    });

    on<AddTouristEvent>((event, emit) {
      Tourist tourist = Tourist();
      tourist.isExpanded = false;
      clientData.tourists.add(tourist);
      emit(ClientInfoState(clientData));
    });

    on<ValidateAllDataEvent>((event, emit) {
      validateAll();
      emit(ClientInfoState(clientData));
    });

    on<RefreshValidatingEvent>((event, emit) {
      refreshValidating();
    });

    on<DropErrorColorEvent>((event, emit) {
      dropErrorColor(event.touristIndex, event.fieldType);
      emit(ClientInfoState(clientData));
    });

    on<ChangeExpansionEvent>((event, emit) {
      clientData.tourists.elementAt(event.touristIndex).isExpanded =
          event.isExpanded;
      emit(ClientInfoState(clientData));
    });
  }

  changeClientInfo(event) {
    switch (event.fieldType) {
      case FieldType.phoneNumber:
        clientData.phoneNumber = event.value;
        break;
      case FieldType.email:
        clientData.email = event.value;
        break;
      default:
        break;
    }
  }

  changeTouristsInfo(event) {
    switch (event.fieldType) {
      case FieldType.name:
        clientData.tourists.elementAt(event.touristIndex).name = event.value;
        break;
      case FieldType.surname:
        clientData.tourists.elementAt(event.touristIndex).surname = event.value;
        event.value;
        break;
      case FieldType.birthday:
        clientData.tourists.elementAt(event.touristIndex).birthday =
            event.value;
        event.value;
        break;
      case FieldType.country:
        clientData.tourists.elementAt(event.touristIndex).country = event.value;
        event.value;
        break;
      case FieldType.passport:
        clientData.tourists.elementAt(event.touristIndex).passport =
            event.value;
        event.value;
        break;
      case FieldType.passportPeriod:
        clientData.tourists.elementAt(event.touristIndex).passportPeriod =
            event.value;
        break;
      default:
        break;
    }
  }

  validatePhoneNumber() {
    if (clientData.phoneNumber.length < 10) {
      clientData.phoneNumberValid = false;
    } else {
      clientData.phoneNumberValid = true;
    }
  }

  validateEmail() {
    if (EmailValidator.validate(clientData.email)) {
      clientData.emailValid = true;
    } else {
      clientData.emailValid = false;
    }
  }

  validateTourists() {
    bool valid = true;
    for (var element in clientData.tourists) {
      if (element.name.isEmpty) {
        element.nameValid = false;
        valid = false;
      } else {
        element.nameValid = true;
      }
      if (element.surname.isEmpty) {
        element.surnameValid = false;
        valid = false;
      } else {
        element.surnameValid = true;
      }
      if (element.birthday.isEmpty) {
        element.birthdayValid = false;
        valid = false;
      } else {
        element.birthdayValid = true;
      }
      if (element.country.isEmpty) {
        element.countryValid = false;
        valid = false;
      } else {
        element.countryValid = true;
      }
      if (element.passport.isEmpty) {
        element.passportValid = false;
        valid = false;
      } else {
        element.passportValid = true;
      }
      if (element.passportPeriod.isEmpty) {
        element.passportPeriodValid = false;
        valid = false;
      } else {
        element.passportPeriodValid = true;
      }
    }
    clientData.touristsFieldsValid = valid;
  }

  validateAll() {
    validatePhoneNumber();
    validateEmail();
    validateTourists();
    if (clientData.phoneNumberValid! &&
        clientData.emailValid! &&
        clientData.touristsFieldsValid!) {
      {
        clientData.allDataValid = true;
      }
    } else {
      clientData.allDataValid = false;
    }
  }

  refreshValidating() {
    clientData.allDataValid = null;
  }

  dropErrorColor(int touristIndex, FieldType fieldType) {
    if (touristIndex == -1) {
      switch (fieldType) {
        case FieldType.phoneNumber:
          clientData.phoneNumberValid = null;
          break;
        case FieldType.email:
          clientData.emailValid = null;
          break;
        default:
          break;
      }
    } else {
      switch (fieldType) {
        case FieldType.name:
          clientData.tourists.elementAt(touristIndex).nameValid = null;
          break;
        case FieldType.surname:
          clientData.tourists.elementAt(touristIndex).surnameValid = null;
          break;
        case FieldType.birthday:
          clientData.tourists.elementAt(touristIndex).birthdayValid = null;
          break;
        case FieldType.country:
          clientData.tourists.elementAt(touristIndex).countryValid = null;
          break;
        case FieldType.passport:
          clientData.tourists.elementAt(touristIndex).passportValid = null;
          break;
        case FieldType.passportPeriod:
          clientData.tourists.elementAt(touristIndex).passportPeriodValid =
              null;
          break;
        default:
          break;
      }
    }
  }
}
