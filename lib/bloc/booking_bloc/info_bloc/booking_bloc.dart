import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:testapp/api/api_retrofit.dart';

part 'booking_event.dart';
part 'booking_state.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  final client = RestClient(Dio());
  BookingBloc() : super(BookingInitial()) {
    on<QueryBookingEvent>((event, emit) async {
      await client
          .getBooking()
          .then((bookingInfo) => emit(BookingInfoState(bookingInfo)));
    });
  }
}
