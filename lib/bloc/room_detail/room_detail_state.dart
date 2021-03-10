part of 'room_detail_cubit.dart';

abstract class RoomDetailState extends Equatable {
  const RoomDetailState();

  @override
  List<Object> get props => [];
}

class RoomDetailInitial extends RoomDetailState {}

class RoomDetailLoading extends RoomDetailState {}

class RoomDetailLoaded extends RoomDetailState {
  final Room room;

  const RoomDetailLoaded({this.room});

  RoomDetailLoaded copyWith({
    Room room,
  }) {
    return RoomDetailLoaded(
      room: room ?? this.room,
    );
  }
}

class RoomDetailError extends RoomDetailState {}
