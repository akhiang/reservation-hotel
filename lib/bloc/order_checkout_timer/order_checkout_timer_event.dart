part of 'order_checkout_timer_bloc.dart';

abstract class OrderCheckoutTimerEvent extends Equatable {
  const OrderCheckoutTimerEvent();

  @override
  List<Object> get props => [];
}

class OrderCheckoutTimerStarted extends OrderCheckoutTimerEvent {
  final int duration;

  const OrderCheckoutTimerStarted({@required this.duration});

  @override
  String toString() => "OrderCheckoutTimerStarted { duration: $duration }";
}

class OrderCheckoutTimerReset extends OrderCheckoutTimerEvent {}

class OrderCheckoutTimerTicked extends OrderCheckoutTimerEvent {
  final int duration;

  const OrderCheckoutTimerTicked({@required this.duration});

  @override
  List<Object> get props => [duration];

  @override
  String toString() => "OrderCheckoutTimerTicked { duration: $duration }";
}
