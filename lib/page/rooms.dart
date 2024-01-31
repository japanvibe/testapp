import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/rooms/rooms_bloc.dart';
import '../ui/rooms/room.dart';

class RoomsPage extends StatelessWidget {
  final String hotelName;
  const RoomsPage({super.key, required this.hotelName});

  @override
  Widget build(BuildContext context) {
    context.read<RoomsBloc>().add(QueryHotelRoomsEvent());
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios, size: 20),
          ),
          title: Text(hotelName,
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.w500))),
      body: BlocBuilder<RoomsBloc, RoomsState>(builder: (context, state) {
        return state is HotelRoomsListState
            ? ListView.builder(
                itemBuilder: (context, i) => RoomInfoWidget(index: i),
                itemCount: state.hotelRooms.rooms!.length)
            : const Center(child: CircularProgressIndicator());
      }),
    );
  }
}
