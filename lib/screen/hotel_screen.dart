import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testapp/widget/custom_slider.dart';

import '../bloc/hotel_bloc/hotel_bloc.dart';
import '../widget/hotel_widget/hote_basic_info_widget.dart';
import '../widget/hotel_widget/hotel_details_info_widget.dart';

class HotelScreen extends StatelessWidget {
  const HotelScreen({super.key});

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
