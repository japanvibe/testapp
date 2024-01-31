import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:testapp/bloc/booking/client/client_bloc.dart';
import 'package:testapp/bloc/booking/client/fields.dart';

import '../../bloc/booking/phone/phone_bloc.dart';

class ClientInfoWidget extends StatelessWidget {
  const ClientInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController phoneController = TextEditingController();
    KeyboardVisibilityController phoneKeyboardVisibilityController =
        KeyboardVisibilityController();
    KeyboardVisibilityController emailKeyboardVisibilityController =
        KeyboardVisibilityController();
    final clientBloc = context.watch<ClientBloc>();
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
        child: BlocBuilder<ClientBloc, ClientState>(builder: (context, state) {
          if (state is ClientInfoState) {
            emailKeyboardVisibilityController.onChange.listen((visible) {
              if (!visible) {
                context.read<ClientBloc>().add(CheckEmailEvent());
              }
            });
            phoneKeyboardVisibilityController.onChange.listen((visible) {
              if (!visible) {
                context.read<ClientBloc>().add(CheckPhoneEvent());
              }
            });
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Информация о покупателе',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 22,
                      color: Colors.black),
                ),
                //Phone
                BlocBuilder<PhoneBloc, PhoneState>(builder: (context, state) {
                  if (state is PhoneNumberState) {
                    phoneController.text = state.phoneNumber;
                    return Padding(
                      padding: const EdgeInsets.only(
                          top: 12, bottom: 0, left: 0, right: 0),
                      child: RawKeyboardListener(
                        focusNode: FocusNode(),
                        onKey: (event) {
                          if (event.runtimeType == RawKeyDownEvent &&
                              event.logicalKey !=
                                  LogicalKeyboardKey.backspace) {
                            context.read<PhoneBloc>().add(
                                EnterDigitEvent(clientBloc, event.character!));
                          }
                          if (event.runtimeType == RawKeyDownEvent &&
                              event.logicalKey ==
                                  LogicalKeyboardKey.backspace) {
                            context
                                .read<PhoneBloc>()
                                .add(DeleteDigitEvent(clientBloc));
                          }
                        },
                        child: KeyboardVisibilityBuilder(
                          controller: phoneKeyboardVisibilityController,
                          builder: (context, keyboardVisible) {
                            return TextFormField(
                              enableInteractiveSelection: false,
                              showCursor: false,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(18)
                              ],
                              controller: phoneController,
                              keyboardType: TextInputType.number,
                              onTap: () {
                                context.read<ClientBloc>().add(
                                    DropErrorColorEvent(
                                        -1, FieldType.phoneNumber));
                                context
                                    .read<PhoneBloc>()
                                    .add(InitPhoneFieldEvent());
                              },
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(20, 20, 43, 1)),
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: clientBloc
                                              .clientData.phoneNumberValid !=
                                          null
                                      ? clientBloc.clientData.phoneNumberValid!
                                          ? Colors.white
                                          : const Color.fromRGBO(
                                              235, 87, 87, 0.15)
                                      : Colors.white,
                                  contentPadding: const EdgeInsets.all(8),
                                  label: const Text(
                                    'Номер телефона',
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w400,
                                        color:
                                            Color.fromRGBO(169, 171, 183, 1)),
                                  ),
                                  border: InputBorder.none),
                            );
                          },
                        ),
                      ),
                    );
                  } else {
                    return Container();
                  }
                }),
                //E-mail
                Padding(
                  padding: const EdgeInsets.only(
                      top: 8, bottom: 8, left: 0, right: 0),
                  child: KeyboardVisibilityBuilder(
                    controller: emailKeyboardVisibilityController,
                    builder: (context, keyboardVisible) {
                      return TextFormField(
                        onTap: () {
                          context
                              .read<ClientBloc>()
                              .add(DropErrorColorEvent(-1, FieldType.email));
                        },
                        showCursor: false,
                        onChanged: (value) {
                          context.read<ClientBloc>().add(ChangeClientInfoEvent(
                              fieldType: FieldType.email, value: value));
                        },
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(20, 20, 43, 1)),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(8),
                          filled: true,
                          label: const Text(
                            'Почта',
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(169, 171, 183, 1)),
                          ),
                          fillColor: state.clientData.emailValid != null
                              ? state.clientData.emailValid!
                                  ? Colors.white
                                  : const Color.fromRGBO(235, 87, 87, 0.15)
                              : Colors.white,
                          border: InputBorder.none,
                        ),
                      );
                    },
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Эти данные никому не передаются. После оплаты мы вышли чек на указанный вами номер и почту',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(130, 135, 150, 1)),
                  ),
                )
              ],
            );
          } else {
            return Container();
          }
        }));
  }
}
