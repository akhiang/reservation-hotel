import 'package:bloc/bloc.dart';
import 'package:dangau_hotel/models/models.dart';
import 'package:equatable/equatable.dart';

part 'order_cart_state.dart';

class OrderCartCubit extends Cubit<OrderCartState> {
  OrderCartCubit() : super(OrderCartList(roomCart: []));

  void addRoomToCart(RoomCart roomCart) {
    print(roomCart);
  }
}
