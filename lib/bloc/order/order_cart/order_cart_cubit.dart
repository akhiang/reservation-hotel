import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'order_cart_state.dart';

class OrderCartCubit extends Cubit<OrderCartState> {
  OrderCartCubit() : super(OrderCartInitial());
}
