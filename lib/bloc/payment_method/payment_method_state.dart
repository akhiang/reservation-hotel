part of 'payment_method_cubit.dart';

abstract class PaymentMethodState extends Equatable {
  const PaymentMethodState();

  @override
  List<Object> get props => [];
}

class PaymentMethodInitial extends PaymentMethodState {}

class PaymentMethodLoading extends PaymentMethodState {}

class PaymentMethodLoaded extends PaymentMethodState {
  final List<PaymentMethod> paymentMethods;

  const PaymentMethodLoaded({this.paymentMethods});

  PaymentMethodLoaded copyWith({
    List<RoomType> paymentMethods,
  }) {
    return PaymentMethodLoaded(
      paymentMethods: paymentMethods ?? this.paymentMethods,
    );
  }
}

class PaymentMethodError extends PaymentMethodState {}
