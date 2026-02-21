part of 'counter_cubit.dart';

@immutable
abstract class CounterState {
  final int counter;
  const CounterState(this.counter);
}

class CounterInitial extends CounterState {
  const CounterInitial() : super(0);
}

class CounterChanged extends CounterState {
  final int counter;
  const CounterChanged(this.counter) : super(counter);
}