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

  const RoomCartLoaded({this.roomCart});

  RoomCartLoaded copyWith({
    List<RoomCart> roomCart,
  }) {
    return RoomCartLoaded(
      roomCart: roomCart ?? this.roomCart,
    );
  }
}

class RoomCartError extends RoomCartState {}
