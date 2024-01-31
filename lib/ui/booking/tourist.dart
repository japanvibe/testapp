import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/booking/client/client_bloc.dart';
import '../../bloc/booking/client/fields.dart';

class TouristInfoWidget extends StatelessWidget {
  const TouristInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClientBloc, ClientState>(
        builder: (context, state) => state is ClientInfoState
            ? Column(
                children: [
                  //Tourist Data
                  ListView.builder(
                      physics: const ScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return ExpansionTile(
                          tilePadding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 16),
                          initiallyExpanded: state.clientData.tourists
                              .elementAt(index)
                              .isExpanded,
                          onExpansionChanged: (isExpanded) {
                            context
                                .read<ClientBloc>()
                                .add(ChangeExpansionEvent(index, isExpanded));
                          },
                          title: Text(
                            index == 0 ? 'Первый турист' : 'Второй турист',
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 22,
                                color: Colors.black),
                          ),
                          trailing: state.clientData.tourists
                                  .elementAt(index)
                                  .isExpanded
                              ? const Image(
                                  image: AssetImage('assets/icon-arrow-up.png'))
                              : const Image(
                                  image:
                                      AssetImage('assets/icon-arrow-down.png')),
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 16),
                              child: Column(
                                children: [
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 12,
                                            bottom: 0,
                                            left: 0,
                                            right: 0),
                                        child: TextFormField(
                                          initialValue: state
                                              .clientData.tourists
                                              .elementAt(index)
                                              .name,
                                          onTap: () {
                                            context.read<ClientBloc>().add(
                                                DropErrorColorEvent(
                                                    index, FieldType.name));
                                          },
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              color: Color.fromRGBO(
                                                  20, 20, 43, 1)),
                                          decoration: InputDecoration(
                                            contentPadding:
                                                const EdgeInsets.all(8),
                                            filled: true,
                                            label: const Text(
                                              'Имя',
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color.fromRGBO(
                                                      169, 171, 183, 1)),
                                            ),
                                            fillColor: state.clientData.tourists
                                                        .elementAt(index)
                                                        .nameValid !=
                                                    null
                                                ? state.clientData.tourists
                                                        .elementAt(index)
                                                        .nameValid!
                                                    ? Colors.white
                                                    : const Color.fromRGBO(
                                                        235, 87, 87, 0.15)
                                                : Colors.white,
                                            border: InputBorder.none,
                                          ),
                                          onChanged: (value) {
                                            context.read<ClientBloc>().add(
                                                ChangeTouristInfoEvent(
                                                    touristIndex: index,
                                                    fieldType: FieldType.name,
                                                    value: value));
                                          },
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8,
                                            bottom: 0,
                                            left: 0,
                                            right: 0),
                                        child: TextFormField(
                                            initialValue: state
                                                .clientData.tourists
                                                .elementAt(index)
                                                .surname,
                                            onTap: () {
                                              context.read<ClientBloc>().add(
                                                  DropErrorColorEvent(index,
                                                      FieldType.surname));
                                            },
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                                color: Color.fromRGBO(
                                                    20, 20, 43, 1)),
                                            decoration: InputDecoration(
                                              contentPadding:
                                                  const EdgeInsets.all(8),
                                              filled: true,
                                              label: const Text(
                                                'Фамилия',
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.w400,
                                                    color: Color.fromRGBO(
                                                        169, 171, 183, 1)),
                                              ),
                                              fillColor: state
                                                          .clientData.tourists
                                                          .elementAt(index)
                                                          .surnameValid !=
                                                      null
                                                  ? state.clientData.tourists
                                                          .elementAt(index)
                                                          .surnameValid!
                                                      ? Colors.white
                                                      : const Color.fromRGBO(
                                                          235, 87, 87, 0.15)
                                                  : Colors.white,
                                              border: InputBorder.none,
                                            ),
                                            onChanged: (value) {
                                              context.read<ClientBloc>().add(
                                                  ChangeTouristInfoEvent(
                                                      touristIndex: index,
                                                      fieldType:
                                                          FieldType.surname,
                                                      value: value));
                                            }),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8,
                                            bottom: 0,
                                            left: 0,
                                            right: 0),
                                        child: TextFormField(
                                            initialValue: state
                                                .clientData.tourists
                                                .elementAt(index)
                                                .birthday,
                                            onTap: () {
                                              context.read<ClientBloc>().add(
                                                  DropErrorColorEvent(index,
                                                      FieldType.birthday));
                                            },
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                                color: Color.fromRGBO(
                                                    20, 20, 43, 1)),
                                            decoration: InputDecoration(
                                              contentPadding:
                                                  const EdgeInsets.all(8),
                                              filled: true,
                                              label: const Text(
                                                'Дата рождения',
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.w400,
                                                    color: Color.fromRGBO(
                                                        169, 171, 183, 1)),
                                              ),
                                              fillColor: state
                                                          .clientData.tourists
                                                          .elementAt(index)
                                                          .birthdayValid !=
                                                      null
                                                  ? state.clientData.tourists
                                                          .elementAt(index)
                                                          .birthdayValid!
                                                      ? Colors.white
                                                      : const Color.fromRGBO(
                                                          235, 87, 87, 0.15)
                                                  : Colors.white,
                                              border: InputBorder.none,
                                            ),
                                            onChanged: (value) {
                                              context.read<ClientBloc>().add(
                                                  ChangeTouristInfoEvent(
                                                      touristIndex: index,
                                                      fieldType:
                                                          FieldType.birthday,
                                                      value: value));
                                            }),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8,
                                            bottom: 0,
                                            left: 0,
                                            right: 0),
                                        child: TextFormField(
                                            initialValue: state
                                                .clientData.tourists
                                                .elementAt(index)
                                                .country,
                                            onTap: () {
                                              context.read<ClientBloc>().add(
                                                  DropErrorColorEvent(index,
                                                      FieldType.country));
                                            },
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                                color: Color.fromRGBO(
                                                    20, 20, 43, 1)),
                                            decoration: InputDecoration(
                                              contentPadding:
                                                  const EdgeInsets.all(8),
                                              filled: true,
                                              label: const Text(
                                                'Гражданство',
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.w400,
                                                    color: Color.fromRGBO(
                                                        169, 171, 183, 1)),
                                              ),
                                              fillColor: state
                                                          .clientData.tourists
                                                          .elementAt(index)
                                                          .countryValid !=
                                                      null
                                                  ? state.clientData.tourists
                                                          .elementAt(index)
                                                          .countryValid!
                                                      ? Colors.white
                                                      : const Color.fromRGBO(
                                                          235, 87, 87, 0.15)
                                                  : Colors.white,
                                              border: InputBorder.none,
                                            ),
                                            onChanged: (value) {
                                              context.read<ClientBloc>().add(
                                                  ChangeTouristInfoEvent(
                                                      touristIndex: index,
                                                      fieldType:
                                                          FieldType.country,
                                                      value: value));
                                            }),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8,
                                            bottom: 0,
                                            left: 0,
                                            right: 0),
                                        child: TextFormField(
                                            initialValue: state
                                                .clientData.tourists
                                                .elementAt(index)
                                                .passport,
                                            onTap: () {
                                              context.read<ClientBloc>().add(
                                                  DropErrorColorEvent(index,
                                                      FieldType.passport));
                                            },
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                                color: Color.fromRGBO(
                                                    20, 20, 43, 1)),
                                            decoration: InputDecoration(
                                              contentPadding:
                                                  const EdgeInsets.all(8),
                                              filled: true,
                                              label: const Text(
                                                'Номер загранпаспорта',
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.w400,
                                                    color: Color.fromRGBO(
                                                        169, 171, 183, 1)),
                                              ),
                                              fillColor: state
                                                          .clientData.tourists
                                                          .elementAt(index)
                                                          .passportValid !=
                                                      null
                                                  ? state.clientData.tourists
                                                          .elementAt(index)
                                                          .passportValid!
                                                      ? Colors.white
                                                      : const Color.fromRGBO(
                                                          235, 87, 87, 0.15)
                                                  : Colors.white,
                                              border: InputBorder.none,
                                            ),
                                            onChanged: (value) {
                                              context.read<ClientBloc>().add(
                                                  ChangeTouristInfoEvent(
                                                      touristIndex: index,
                                                      fieldType:
                                                          FieldType.passport,
                                                      value: value));
                                            }),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8,
                                            bottom: 0,
                                            left: 0,
                                            right: 0),
                                        child: TextFormField(
                                            initialValue: state
                                                .clientData.tourists
                                                .elementAt(index)
                                                .passportPeriod,
                                            onTap: () {
                                              context.read<ClientBloc>().add(
                                                  DropErrorColorEvent(
                                                      index,
                                                      FieldType
                                                          .passportPeriod));
                                            },
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                                color: Color.fromRGBO(
                                                    20, 20, 43, 1)),
                                            decoration: InputDecoration(
                                              contentPadding:
                                                  const EdgeInsets.all(8),
                                              filled: true,
                                              label: const Text(
                                                'Срок действия загранпаспорта',
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.w400,
                                                    color: Color.fromRGBO(
                                                        169, 171, 183, 1)),
                                              ),
                                              fillColor: state
                                                          .clientData.tourists
                                                          .elementAt(index)
                                                          .passportPeriodValid !=
                                                      null
                                                  ? state.clientData.tourists
                                                          .elementAt(index)
                                                          .passportPeriodValid!
                                                      ? Colors.white
                                                      : const Color.fromRGBO(
                                                          235, 87, 87, 0.15)
                                                  : Colors.white,
                                              border: InputBorder.none,
                                            ),
                                            onChanged: (value) {
                                              context.read<ClientBloc>().add(
                                                  ChangeTouristInfoEvent(
                                                      touristIndex: index,
                                                      fieldType: FieldType
                                                          .passportPeriod,
                                                      value: value));
                                            }),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        );
                      },
                      itemCount: state.clientData.tourists.length),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Добавить туриста',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 22,
                              color: Colors.black),
                        ),
                        InkWell(
                          onTap: () {
                            context.read<ClientBloc>().add(AddTouristEvent());
                          },
                          child: const Image(
                            image: AssetImage('assets/icon-add.png'),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )
            : Container());
  }
}
