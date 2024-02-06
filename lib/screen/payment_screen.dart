import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testapp/screen/hotel_screen.dart';

import '../bloc/hotel_bloc/hotel_bloc.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
          title: const Text('Заказ оплачен',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500))),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding:
                      EdgeInsets.only(left: 0, right: 0, top: 150, bottom: 60),
                  child: Image(image: AssetImage('assets/party-popper.png')),
                ),
                const Text('Ваш заказ принят в работу',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: Colors.black)),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 40, right: 40, top: 20, bottom: 0),
                  child: Text(
                    'Подтверждение заказа №${Random().nextInt(1000000)} может занять некоторое время (от 1 часа до суток). Как только мы получим ответ от туроператора, вам на почту придет уведомление.',
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(130, 135, 150, 1)),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 48,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      elevation: 0,
                      backgroundColor: const Color.fromRGBO(13, 114, 255, 1)),
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => BlocProvider(
                                  create: (context) => HotelBloc(),
                                  child: const HotelScreen(),
                                )),
                        (route) => false);
                  },
                  child: const Text('Супер!',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white))),
            )
          ],
        ),
      ),
    );
  }
}
