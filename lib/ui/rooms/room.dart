import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:testapp/ui/slider.dart';
import '../../bloc/booking/info/booking_bloc.dart';
import '../../bloc/rooms/rooms_bloc.dart';
import '../../page/booking.dart';

class RoomInfoWidget extends StatelessWidget {
  final int index;

  const RoomInfoWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RoomsBloc, RoomsState>(
        builder: (context, state) => Padding(
            padding: const EdgeInsets.all(16.0),
            child: state is HotelRoomsListState
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomSlider(
                          items: state.hotelRooms.rooms!
                              .elementAt(index)
                              .image_urls!),
                      Text(
                        state.hotelRooms.rooms!.elementAt(index).name!,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 22,
                            color: Color.fromRGBO(0, 0, 0, 1)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GridView.builder(
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisSpacing: 5,
                                  crossAxisCount: 2,
                                  childAspectRatio: 3),
                          itemBuilder: (context, i) {
                            return Text(
                              state.hotelRooms.rooms!
                                  .elementAt(index)
                                  .peculiarities!
                                  .elementAt(i),
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(130, 135, 150, 1)),
                            );
                          },
                          itemCount: state.hotelRooms.rooms!
                              .elementAt(index)
                              .peculiarities!
                              .length,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: SizedBox(
                          height: 29,
                          child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                  alignment: Alignment.center,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                  elevation: 0,
                                  backgroundColor:
                                      const Color.fromRGBO(13, 114, 255, 0.1)),
                              onPressed: () {},
                              label: const Icon(Icons.arrow_forward_ios,
                                  size: 20,
                                  color: Color.fromRGBO(13, 114, 255, 1)),
                              icon: const Text('Подробнее о номере',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromRGBO(13, 114, 255, 1)))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 19.0),
                        child: RichText(
                          text: TextSpan(
                              text:
                                  '${NumberFormat('#,###,000').format(state.hotelRooms.rooms!.elementAt(index).price).replaceAll(',', ' ')} ₽ ',
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 30,
                                  color: Color.fromRGBO(0, 0, 0, 1)),
                              children: [
                                TextSpan(
                                    text: state.hotelRooms.rooms!
                                        .elementAt(index)
                                        .price_per!
                                        .toLowerCase(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                        color:
                                            Color.fromRGBO(130, 135, 150, 1))),
                              ]),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 48,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                elevation: 0,
                                backgroundColor:
                                    const Color.fromRGBO(13, 114, 255, 1)),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => BlocProvider(
                                        create: (context) => BookingBloc(),
                                        child: const BookingPage(),
                                      )));
                            },
                            child: const Text('Выбрать номер',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white))),
                      )
                    ],
                  )
                : Container()));
  }
}
