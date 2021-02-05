part of 'ordering_cubit.dart';

abstract class OrderingState extends Equatable {
  const OrderingState();

  @override
  List<Object> get props => [];
}

class OrderingInitial extends OrderingState {}

class OrderingStatus extends OrderingState {
  final OrderingStatusType orderStatusType;

  OrderingStatus({@required this.orderStatusType});
}
