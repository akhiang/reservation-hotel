import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'ordering_status_state.dart';

class OrderingStatusCubit extends Cubit<OrderingStatusState> {
  OrderingStatusCubit() : super(OrderingStatusInitial());

  void changeStatusToInitial() => emit(OrderingStatusInitial());
  void changeStatusToOnRoomSelection() => emit(OrderingStatusOnRoomSelection());
  void changeStatusToOnRoomSelected() => emit(OrderingStatusOnRoomSelected());
}
