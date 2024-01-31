import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/slider/slider_bloc.dart';

class CustomSlider extends StatelessWidget {
  final List<String> items;
  const CustomSlider({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SliderBloc(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Builder(builder: (context) {
              return Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  CarouselSlider(
                    items: items
                        .map((url) => Builder(
                            builder: (context) => Image.network(
                                  url,
                                  errorBuilder: (context, object, stackTrace) {
                                    return const Center(
                                      child: Icon(Icons.error),
                                    );
                                  },
                                  loadingBuilder: (context, child, progress) {
                                    return progress == null
                                        ? child
                                        : const Center(
                                            child: CircularProgressIndicator());
                                  },
                                )))
                        .toList(),
                    options: CarouselOptions(
                        viewportFraction: 1,
                        onPageChanged: (index, reason) {
                          context
                              .read<SliderBloc>()
                              .add(ChangeSliderPageEvent(index));
                        }),
                  ),
                  BlocBuilder<SliderBloc, SliderState>(
                      builder: (context, state) => state is SliderPageIndexState
                          ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: SizedBox(
                                    width: 11 * items.length + 8,
                                    height: 15,
                                    child: Container(
                                      color: Colors.white,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          ListView.builder(
                                            shrinkWrap: true,
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: (context, i) =>
                                                Padding(
                                              padding:
                                                  const EdgeInsets.all(2.0),
                                              child: SizedBox(
                                                width: 7,
                                                height: 7,
                                                child: Container(
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: state.pageIndex ==
                                                                i
                                                            ? Colors.black
                                                            : Color.fromRGBO(
                                                                0,
                                                                0,
                                                                0,
                                                                i == 0
                                                                    ? 0.7
                                                                    : 0.7 -
                                                                        i *
                                                                            5 *
                                                                            0.05))),
                                              ),
                                            ),
                                            itemCount: items.length,
                                          )
                                        ],
                                      ),
                                    ),
                                  )),
                            )
                          : Container())
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
