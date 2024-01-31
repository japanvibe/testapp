import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/booking/info/booking_bloc.dart';

class HotelWidget extends StatelessWidget {
  const HotelWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingBloc, BookingState>(
        builder: (context, state) => Padding(
            padding:
                const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 0),
            child: state is BookingInfoState
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: SizedBox(
                          width: 149,
                          height: 29,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: const Color.fromRGBO(255, 199, 0, 0.2)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Color.fromRGBO(255, 168, 0, 1),
                                  size: 15,
                                ),
                                Text(
                                  '${state.bookingInfo.horating} ${state.bookingInfo.rating_name}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      color: Color.fromRGBO(255, 168, 0, 1)),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Text(
                        state.bookingInfo.hotel_name!,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 22,
                            color: Color.fromRGBO(0, 0, 0, 1)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: TextButton(
                            style: TextButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(3)),
                                minimumSize: Size.zero,
                                padding: EdgeInsets.zero),
                            onPressed: () {},
                            child: Text(
                              state.bookingInfo.hotel_adress!,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: Color.fromRGBO(13, 114, 255, 1)),
                            )),
                      ),
                    ],
                  )
                : Container()));
  }
}
