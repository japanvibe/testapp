part of 'slider_bloc.dart';

@immutable
abstract class SliderEvent {}

class ChangeSliderPageEvent extends SliderEvent {
  final int index;
  ChangeSliderPageEvent(this.index);
}
