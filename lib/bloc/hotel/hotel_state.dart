part of 'hotel_bloc.dart';

@immutable
abstract class HotelState {}

class HotelInitial extends HotelState {}

class HotelInfoState extends HotelState {
  final Hotel hotel;
  HotelInfoState(this.hotel);
}
