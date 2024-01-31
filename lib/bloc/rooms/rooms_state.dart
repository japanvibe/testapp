part of 'rooms_bloc.dart';

@immutable
abstract class RoomsState {}

class RoomsInitial extends RoomsState {}

class HotelRoomsListState extends RoomsState {
  final HotelRooms hotelRooms;
  HotelRoomsListState(this.hotelRooms);
}
