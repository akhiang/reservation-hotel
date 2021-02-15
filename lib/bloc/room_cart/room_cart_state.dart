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

  const RoomCartLoaded({this.roomCart, this.selectedRoomCart});

  RoomCartLoaded copyWith({
    List<RoomCart> roomCart,
    List<RoomCart> selectedRoomCart,
  }) {
    return RoomCartLoaded(
      roomCart: roomCart ?? this.roomCart,
      selectedRoomCart: selectedRoomCart ?? this.selectedRoomCart,
    );
  }

  @override
  List<Object> get props => [roomCart, selectedRoomCart];

  @override
  String toString() =>
      'RoomCartLoaded { roomCart: $roomCart, selectedRoomCart: $selectedRoomCart }';
}

class RoomCartError extends RoomCartState {}
