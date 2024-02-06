import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testapp/screen/hotel_screen.dart';

import 'bloc/hotel_bloc/hotel_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            colorScheme: const ColorScheme.light(),
            fontFamily: 'SF Pro Display',
            dividerColor: Colors.transparent),
        debugShowCheckedModeBanner: false,
        home: BlocProvider<HotelBloc>(
            create: (context) => HotelBloc(), child: const HotelScreen()));
  }
}
