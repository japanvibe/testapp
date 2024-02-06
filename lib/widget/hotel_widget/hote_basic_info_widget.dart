import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../bloc/hotel_bloc/hotel_bloc.dart';

class HotelBasicInfoWidget extends StatelessWidget {
  const HotelBasicInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HotelBloc, HotelState>(
        builder: (context, state) => Padding(
              padding: const EdgeInsets.all(16.0),
              child: state is HotelInfoState
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
                                  color:
                                      const Color.fromRGBO(255, 199, 0, 0.2)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Color.fromRGBO(255, 168, 0, 1),
                                    size: 15,
                                  ),
                                  Text(
                                    '${state.hotel.rating} ${state.hotel.rating_name}',
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
                          state.hotel.name!,
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
                                state.hotel.adress!,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: Color.fromRGBO(13, 114, 255, 1)),
                              )),
                        ),
                        RichText(
                          text: TextSpan(
                              text:
                                  'от ${NumberFormat('#,###,000').format(state.hotel.minimal_price).replaceAll(',', ' ')} ₽ ',
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 30,
                                  color: Color.fromRGBO(0, 0, 0, 1)),
                              children: [
                                TextSpan(
                                    text:
                                        state.hotel.price_for_it!.toLowerCase(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                        color:
                                            Color.fromRGBO(130, 135, 150, 1)))
                              ]),
                        ),
                      ],
                    )
                  : Container(),
            ));
  }
}
