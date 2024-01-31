import 'package:dio/dio.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../api/api_retrofit.dart';

part 'hotel_event.dart';
part 'hotel_state.dart';

class HotelBloc extends Bloc<HotelEvent, HotelState> {
  final client = RestClient(Dio());
  HotelBloc() : super(HotelInitial()) {
    on<QueryHotelEvent>((event, emit) async {
      await client.getHotel().then((hotel) => emit(HotelInfoState(hotel)));
    });
  }
}
