import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:testapp/screen/payment_screen.dart';

import '../../bloc/booking_bloc/client_bloc/client_bloc.dart';
import '../../bloc/booking_bloc/info_bloc/booking_bloc.dart';

class PaymentWidget extends StatelessWidget {
  const PaymentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClientBloc, ClientState>(
        builder: (context, state) => state is ClientInfoState
            ? Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    BlocBuilder<BookingBloc, BookingState>(
                        builder: (context, state) => state is BookingInfoState
                            ? Padding(
                                padding: const EdgeInsets.only(bottom: 12),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8,
                                          right: 8,
                                          bottom: 16,
                                          top: 0),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              'Тур',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 16,
                                                  color: Color.fromRGBO(
                                                      130, 135, 150, 1)),
                                            ),
                                            Text(
                                              '${NumberFormat('#,###,000').format(state.bookingInfo.tour_price).replaceAll(',', ' ')} ₽',
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 16,
                                                  color: Colors.black),
                                            )
                                          ]),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8,
                                          right: 8,
                                          bottom: 16,
                                          top: 0),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              'Топливный сбор',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 16,
                                                  color: Color.fromRGBO(
                                                      130, 135, 150, 1)),
                                            ),
                                            Text(
                                              '${NumberFormat('#,###,000').format(state.bookingInfo.fuel_charge).replaceAll(',', ' ')} ₽',
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 16,
                                                  color: Colors.black),
                                            )
                                          ]),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8,
                                          right: 8,
                                          bottom: 16,
                                          top: 0),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              'Сервисный сбор',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 16,
                                                  color: Color.fromRGBO(
                                                      130, 135, 150, 1)),
                                            ),
                                            Text(
                                              '${NumberFormat('#,###,000').format(state.bookingInfo.service_charge).replaceAll(',', ' ')} ₽',
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 16,
                                                  color: Colors.black),
                                            )
                                          ]),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8,
                                          right: 8,
                                          bottom: 16,
                                          top: 0),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              'К оплате',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 16,
                                                  color: Color.fromRGBO(
                                                      130, 135, 150, 1)),
                                            ),
                                            Text(
                                              '${NumberFormat('#,###,000').format(state.bookingInfo.tour_price! + state.bookingInfo.fuel_charge! + state.bookingInfo.service_charge!).replaceAll(',', ' ')} ₽',
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 16,
                                                  color: Colors.black),
                                            )
                                          ]),
                                    )
                                  ],
                                ),
                              )
                            : Container()),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 48,
                      child: BlocListener<ClientBloc, ClientState>(
                        listener: (context, state) {
                          if (state is ClientInfoState) {
                            if (context
                                        .read<ClientBloc>()
                                        .clientData
                                        .allDataValid !=
                                    null &&
                                context
                                    .read<ClientBloc>()
                                    .clientData
                                    .allDataValid!) {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const PaymentScreen()));
                              context
                                  .read<ClientBloc>()
                                  .add(RefreshValidatingEvent());
                            }
                          }
                        },
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                elevation: 0,
                                backgroundColor:
                                    const Color.fromRGBO(13, 114, 255, 1)),
                            onPressed: () {
                              context
                                  .read<ClientBloc>()
                                  .add(ValidateAllDataEvent());
                            },
                            child: BlocBuilder<BookingBloc, BookingState>(
                                builder: (context, state) => state
                                        is BookingInfoState
                                    ? Text(
                                        'Оплатить ${NumberFormat('#,###,000').format(state.bookingInfo.tour_price! + state.bookingInfo.fuel_charge! + state.bookingInfo.service_charge!).replaceAll(',', ' ')} ₽',
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white))
                                    : Container())),
                      ),
                    ),
                  ],
                ),
              )
            : Container());
  }
}
