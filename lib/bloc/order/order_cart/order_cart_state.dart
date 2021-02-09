part of 'order_cart_cubit.dart';

abstract class OrderCartState extends Equatable {
  const OrderCartState();

  @override
  List<Object> get props => [];
}

class OrderCartList extends OrderCartState {
  final List<RoomCart> roomCart;

  const OrderCartList({
    this.roomCart,
  });

  OrderCartList copyWith({
    List<RoomCart> roomCart,
  }) {
    return OrderCartList(
      roomCart: roomCart ?? this.roomCart,
    );
  }

  @override
  List<Object> get props => [roomCart];

  @override
  String toString() => 'OrderCartList { roomCart: $roomCart }';
}
