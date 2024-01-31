part of 'client_bloc.dart';

@immutable
abstract class ClientEvent {}

class CheckPhoneEvent extends ClientEvent {}

class CheckEmailEvent extends ClientEvent {}

class RefreshValidatingEvent extends ClientEvent {}

class DropErrorColorEvent extends ClientEvent {
  final int touristIndex;
  final FieldType fieldType;
  DropErrorColorEvent(this.touristIndex, this.fieldType);
}

class ChangeClientInfoEvent extends ClientEvent {
  final FieldType fieldType;
  final dynamic value;
  ChangeClientInfoEvent({required this.fieldType, required this.value});
}

class AddTouristEvent extends ClientEvent {}

class ChangeTouristInfoEvent extends ClientEvent {
  final int touristIndex;
  final FieldType fieldType;
  final dynamic value;
  ChangeTouristInfoEvent(
      {required this.touristIndex,
      required this.fieldType,
      required this.value});
}

class ValidateAllDataEvent extends ClientEvent {}

class ChangeExpansionEvent extends ClientEvent {
  final int touristIndex;
  final bool isExpanded;
  ChangeExpansionEvent(this.touristIndex, this.isExpanded);
}
