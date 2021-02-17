import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dangau_hotel/utils/ticker.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'order_checkout_timer_event.dart';
part 'order_checkout_timer_state.dart';

class OrderCheckoutTimerBloc
    extends Bloc<OrderCheckoutTimerEvent, OrderCheckoutTimerState> {
  final Ticker _ticker;
  static const int _duration = 900;

  StreamSubscription<int> _tickerSubscription;

  OrderCheckoutTimerBloc({@required Ticker ticker})
      : assert(ticker != null),
        _ticker = ticker,
        super(OrderCheckoutTimerInitial(_duration));

  @override
  Stream<OrderCheckoutTimerState> mapEventToState(
    OrderCheckoutTimerEvent event,
  ) async* {
    if (event is OrderCheckoutTimerStarted) {
      yield* _timerStarted(event);
    } else if (event is OrderCheckoutTimerReset) {
      yield* _timerReset(event);
    } else if (event is OrderCheckoutTimerTicked) {
      yield* _timerTicked(event);
    }
  }

  @override
  Future<void> close() {
    _tickerSubscription?.cancel();
    return super.close();
  }

  Stream<OrderCheckoutTimerState> _timerStarted(
      OrderCheckoutTimerStarted start) async* {
    yield OrderCheckoutTimerRunInProgress(start.duration);
    _tickerSubscription?.cancel();
    _tickerSubscription = _ticker.tick(ticks: start.duration).listen(
        (duration) => add(OrderCheckoutTimerTicked(duration: duration)));
  }

  Stream<OrderCheckoutTimerState> _timerReset(
      OrderCheckoutTimerReset reset) async* {
    _tickerSubscription?.cancel();
    yield OrderCheckoutTimerInitial(_duration);
  }

  Stream<OrderCheckoutTimerState> _timerTicked(
      OrderCheckoutTimerTicked tick) async* {
    yield tick.duration > 0
        ? OrderCheckoutTimerRunInProgress(tick.duration)
        : OrderCheckoutTimerRunComplete();
  }
}
