import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitial());
  int _counter = 0;
  void incrementCounter() {
    _counter++;
    emit(CounterChanged(_counter));
  }
}
