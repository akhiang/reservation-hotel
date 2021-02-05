import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'ordering_state.dart';

enum OrderingStatusType {
  OnOrder,
  OnCheckOut,
}

class OrderingCubit extends Cubit<OrderingState> {
  OrderingCubit() : super(OrderingInitial());
}
