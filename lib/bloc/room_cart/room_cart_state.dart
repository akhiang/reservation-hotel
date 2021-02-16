part of 'room_cart_cubit.dart';

abstract class RoomCartState extends Equatable {
  const RoomCartState();

  @override
  List<Object> get props => [];
}

class RoomCartInitial extends RoomCartState {}

class RoomCartLoading extends RoomCartState {}

class RoomCartLoaded extends RoomCartState {
  final List<RoomCart> roomCart;
  final List<RoomCart> selectedRoomCart;
  final double total;

  const RoomCartLoaded({
    this.roomCart,
    this.selectedRoomCart,
    this.total,
  });

  RoomCartLoaded copyWith({
    List<RoomCart> roomCart,
    List<RoomCart> selectedRoomCart,
    double total,
  }) {
    return RoomCartLoaded(
      roomCart: roomCart ?? this.roomCart,
      selectedRoomCart: selectedRoomCart ?? this.selectedRoomCart,
      total: total ?? this.total,
    );
  }

  @override
  List<Object> get props => [roomCart, selectedRoomCart, total];

  @override
  String toString() =>
      'RoomCartLoaded { roomCart: $roomCart, selectedRoomCart: $selectedRoomCart }';
}

class RoomCartError extends RoomCartState {}
