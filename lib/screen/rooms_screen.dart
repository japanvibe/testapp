import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/rooms_bloc/rooms_bloc.dart';
import '../widget/rooms_widget/room_info_widget.dart';

class RoomsScreen extends StatelessWidget {
  final String hotelName;
  const RoomsScreen({super.key, required this.hotelName});

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
