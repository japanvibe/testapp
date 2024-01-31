import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testapp/bloc/rooms/rooms_bloc.dart';
import '../../bloc/hotel/hotel_bloc.dart';
import '../../page/rooms.dart';

class HotelDetailsInfoWidget extends StatelessWidget {
  const HotelDetailsInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HotelBloc, HotelState>(
        builder: (context, state) => Padding(
              padding: const EdgeInsets.all(16.0),
              child: state is HotelInfoState
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Об отеле',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 22,
                              color: Color.fromRGBO(0, 0, 0, 1)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GridView.builder(
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    mainAxisSpacing: 5,
                                    crossAxisCount: 2,
                                    childAspectRatio: 3),
                            itemBuilder: (context, i) {
                              return Text(
                                state.hotel.about_the_hotel!.peculiarities!
                                    .elementAt(i),
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromRGBO(130, 135, 150, 1)),
                              );
                            },
                            itemCount: state
                                .hotel.about_the_hotel!.peculiarities!.length,
                          ),
                        ),
                        Text(
                          state.hotel.about_the_hotel!.description!,
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(0, 0, 0, 0.9)),
                        ),
                        InkWell(
                          onTap: () {},
                          child: const ListTile(
                            leading: Image(
                                image: AssetImage('assets/emoji-happy.png')),
                            title: Text(
                              'Удобства',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(44, 48, 53, 1)),
                            ),
                            subtitle: Text(
                              'Самое необходимое',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(130, 135, 150, 1)),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              size: 20,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: const ListTile(
                            leading: Image(
                                image: AssetImage('assets/tick-square.png')),
                            title: Text(
                              'Что включено',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(44, 48, 53, 1)),
                            ),
                            subtitle: Text(
                              'Самое необходимое',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(130, 135, 150, 1)),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              size: 20,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: const ListTile(
                            leading: Image(
                                image: AssetImage('assets/close-square.png')),
                            title: Text(
                              'Что не включено',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(44, 48, 53, 1)),
                            ),
                            subtitle: Text(
                              'Самое необходимое',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(130, 135, 150, 1)),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              size: 20,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 25.0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 48,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    elevation: 0,
                                    backgroundColor:
                                        const Color.fromRGBO(13, 114, 255, 1)),
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => BlocProvider(
                                            create: (context) => RoomsBloc(),
                                            child: RoomsPage(
                                                hotelName: state.hotel.name!),
                                          )));
                                },
                                child: const Text('К выбору номера',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white))),
                          ),
                        )
                      ],
                    )
                  : Container(),
            ));
  }
}
