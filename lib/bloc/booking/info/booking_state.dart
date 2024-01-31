part of 'booking_bloc.dart';

@immutable
abstract class BookingState {}

class BookingInitial extends BookingState {}

class BookingInfoState extends BookingState {
  final Booking bookingInfo;
  BookingInfoState(this.bookingInfo);
}
