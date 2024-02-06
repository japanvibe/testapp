import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/booking_bloc/info_bloc/booking_bloc.dart';

class BookingInfoWidget extends StatelessWidget {
  const BookingInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingBloc, BookingState>(
      builder: (context, state) {
        return Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
            child: state is BookingInfoState
                ? Column(children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Expanded(
                              child: Text(
                                'Вылет из',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    color: Color.fromRGBO(130, 135, 150, 1)),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                state.bookingInfo.departure!,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    color: Colors.black),
                              ),
                            )
                          ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Expanded(
                              child: Text(
                                'Страна, город',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    color: Color.fromRGBO(130, 135, 150, 1)),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                state.bookingInfo.arrival_country!,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    color: Colors.black),
                              ),
                            )
                          ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Expanded(
                              child: Text(
                                'Даты',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    color: Color.fromRGBO(130, 135, 150, 1)),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                '${state.bookingInfo.tour_date_start!} - ${state.bookingInfo.tour_date_stop!}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    color: Colors.black),
                              ),
                            )
                          ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Expanded(
                              child: Text(
                                'Отель',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    color: Color.fromRGBO(130, 135, 150, 1)),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                state.bookingInfo.hotel_name!,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    color: Colors.black),
                              ),
                            )
                          ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Expanded(
                              child: Text(
                                'Номер',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    color: Color.fromRGBO(130, 135, 150, 1)),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                state.bookingInfo.room!,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    color: Colors.black),
                              ),
                            )
                          ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Expanded(
                              child: Text(
                                'Питание',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    color: Color.fromRGBO(130, 135, 150, 1)),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                state.bookingInfo.nutrition!,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    color: Colors.black),
                              ),
                            )
                          ]),
                    )
                  ])
                : Container());
      },
    );
  }
}
