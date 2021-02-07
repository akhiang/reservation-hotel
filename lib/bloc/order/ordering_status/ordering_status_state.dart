part of 'ordering_status_cubit.dart';

abstract class OrderingStatusState extends Equatable {
  const OrderingStatusState();

  @override
  List<Object> get props => [];
}

class OrderingStatusInitial extends OrderingStatusState {}

class OrderingStatusOnRoomSelection extends OrderingStatusState {}

class OrderingStatusOnRoomSelected extends OrderingStatusState {}
