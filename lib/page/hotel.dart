import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testapp/ui/hotel/basic.dart';
import 'package:testapp/ui/slider.dart';
import '../bloc/hotel/hotel_bloc.dart';
import '../ui/hotel/details.dart';

class HotelPage extends StatelessWidget {
  const HotelPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<HotelBloc>().add(QueryHotelEvent());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Отель',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
      ),
      body: BlocBuilder<HotelBloc, HotelState>(
        builder: (context, state) {
          return state is HotelInfoState
              ? SingleChildScrollView(
                  child: Column(
                    children: [
                      CustomSlider(items: state.hotel.image_urls!),
                      const HotelBasicInfoWidget(),
                      const HotelDetailsInfoWidget()
                    ],
                  ),
                )
              : const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
