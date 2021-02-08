part of 'room_cubit.dart';

abstract class RoomState extends Equatable {
  const RoomState();

  @override
  List<Object> get props => [];
}

class RoomInitial extends RoomState {}

class RoomLoading extends RoomState {}

class RoomLoaded extends RoomState {
  final List<Room> rooms;

  const RoomLoaded({this.rooms});

  RoomLoaded copyWith({
    List<Room> rooms,
  }) {
    return RoomLoaded(
      rooms: rooms ?? this.rooms,
    );
  }
}

class RoomError extends RoomState {}
