part of 'order_checkout_timer_bloc.dart';

abstract class OrderCheckoutTimerState extends Equatable {
  final int duration;

  const OrderCheckoutTimerState(this.duration);

  @override
  List<Object> get props => [duration];
}

class OrderCheckoutTimerInitial extends OrderCheckoutTimerState {
  const OrderCheckoutTimerInitial(int duration) : super(duration);

  @override
  String toString() => 'OrderCheckoutTimerInitial { duration: $duration }';
}

class OrderCheckoutTimerRunInProgress extends OrderCheckoutTimerState {
  const OrderCheckoutTimerRunInProgress(int duration) : super(duration);

  @override
  String toString() =>
      'OrderCheckoutTimerRunInProgress { duration: $duration }';
}

class OrderCheckoutTimerRunComplete extends OrderCheckoutTimerState {
  const OrderCheckoutTimerRunComplete() : super(0);
}
