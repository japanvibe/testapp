part of 'slider_bloc.dart';

@immutable
abstract class SliderState {}

class SliderInitial extends SliderState {}

class SliderPageIndexState extends SliderState {
  final int pageIndex;
  SliderPageIndexState(this.pageIndex);
}
