import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testapp/bloc/booking/client/client_bloc.dart';
import 'package:testapp/bloc/booking/info/booking_bloc.dart';
import 'package:testapp/bloc/booking/phone/phone_bloc.dart';
import 'package:testapp/ui/booking/booking.dart';
import 'package:testapp/ui/booking/client.dart';
import 'package:testapp/ui/booking/hotel.dart';
import 'package:testapp/ui/booking/payment.dart';
import 'package:testapp/ui/booking/tourist.dart';

class BookingPage extends StatelessWidget {
  const BookingPage({super.key});

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
