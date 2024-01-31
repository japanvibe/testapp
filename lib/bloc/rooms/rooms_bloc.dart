import 'package:dio/dio.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../api/api_retrofit.dart';

part 'rooms_event.dart';
part 'rooms_state.dart';

class RoomsBloc extends Bloc<RoomsEvent, RoomsState> {
  final client = RestClient(Dio());
  RoomsBloc() : super(RoomsInitial()) {
    on<QueryHotelRoomsEvent>((event, emit) async {
      await client
          .getHotelRooms()
          .then((rooms) => emit(HotelRoomsListState(rooms)));
    });
  }
}
