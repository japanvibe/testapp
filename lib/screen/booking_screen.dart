import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/booking_bloc/client_bloc/client_bloc.dart';
import '../bloc/booking_bloc/info_bloc/booking_bloc.dart';
import '../bloc/booking_bloc/phone_bloc/phone_bloc.dart';
import '../widget/booking_widget/booking_info_widget.dart';
import '../widget/booking_widget/client_info_widget.dart';
import '../widget/booking_widget/hotel_info_widget.dart';
import '../widget/booking_widget/payment_widget.dart';
import '../widget/booking_widget/tourist_info_widget.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<BookingBloc>().add(QueryBookingEvent());
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios, size: 20),
          ),
          title: const Text('Бронирование',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500))),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HotelWidget(),
            const BookingInfoWidget(),
            MultiBlocProvider(
                providers: [
                  BlocProvider(create: (context) => ClientBloc()),
                  BlocProvider(create: (context) => PhoneBloc())
                ],
                child: const Column(children: [
                  ClientInfoWidget(),
                  TouristInfoWidget(),
                  PaymentWidget()
                ])),
          ],
        ),
      ),
    );
  }
}
