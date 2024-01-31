import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'slider_event.dart';
part 'slider_state.dart';

class SliderBloc extends Bloc<SliderEvent, SliderState> {
  SliderBloc() : super(SliderPageIndexState(0)) {
    on<ChangeSliderPageEvent>((event, emit) {
      emit(SliderPageIndexState(event.index));
    });
  }
}
