import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'ordering_status_state.dart';

class OrderingStatusCubit extends Cubit<OrderingStatusState> {
  OrderingStatusCubit() : super(OrderingStatusInitial());
}
