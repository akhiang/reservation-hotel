import 'package:bloc/bloc.dart';
import 'package:dangau_hotel/models/models.dart';
import 'package:dangau_hotel/services/services.dart';
import 'package:equatable/equatable.dart';

part 'room_state.dart';

class RoomCubit extends Cubit<RoomState> {
  final RoomService _roomService;

  RoomCubit(this._roomService) : super(RoomInitial());

  Future<void> getHotelRooms(int hotelId) async {
    emit(RoomLoading());
    try {
      final List<Room> rooms = await _roomService.getRooms(hotelId);
      emit(RoomLoaded(rooms: rooms));
    } catch (e) {
      print(e.toString());
      emit(RoomError());
    }
  }
}
