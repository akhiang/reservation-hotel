part of 'order_cubit.dart';

abstract class OrderState extends Equatable {
  const OrderState();

  @override
  List<Object> get props => [];
}

class OrderInitial extends OrderState {}

class OrderLoading extends OrderState {}

class OrderSuccess extends OrderState {
  final OrderResponse orderResponse;

  const OrderSuccess({this.orderResponse});

  OrderSuccess copyWith({
    LoginResponse orderResponse,
  }) {
    return OrderSuccess(
      orderResponse: orderResponse ?? this.orderResponse,
    );
  }

  @override
  List<Object> get props => [orderResponse];
}

class OrderError extends OrderState {}
