part of 'client_bloc.dart';

@immutable
abstract class ClientState {}

class ClientInitial extends ClientState {}

class ClientInfoState extends ClientState {
  final ClientData clientData;
  ClientInfoState(this.clientData);
}

class ClientData {
  List<String> phoneNumber = [];
  String email = '';
  List<Tourist> tourists = List.filled(1, Tourist(), growable: true);

  bool? phoneNumberValid;
  bool? emailValid;
  bool? touristsFieldsValid;
  bool? allDataValid;
}

class Tourist {
  String name = '';
  bool? nameValid;

  String surname = '';
  bool? surnameValid;

  String birthday = '';
  bool? birthdayValid;

  String country = '';
  bool? countryValid;

  String passport = '';
  bool? passportValid;

  String passportPeriod = '';
  bool? passportPeriodValid;

  bool isExpanded = true;
}
