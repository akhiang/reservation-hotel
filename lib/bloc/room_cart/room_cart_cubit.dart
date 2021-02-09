import 'package:bloc/bloc.dart';
import 'package:dangau_hotel/models/models.dart';
import 'package:dangau_hotel/services/services.dart';
import 'package:equatable/equatable.dart';

part 'room_cart_state.dart';

class RoomCartCubit extends Cubit<RoomCartState> {
  final RoomService _roomService;

  RoomCartCubit(this._roomService) : super(RoomCartInitial());

  RoomPreference roomPreference = RoomPreference(
    isSmoke: true,
    isSingleBed: true,
    note: '',
  );

  Future<void> getHotelRoomsToCart(int hotelId) async {
    emit(RoomCartLoading());
    try {
      final List<Room> rooms = await _roomService.getRooms(hotelId);
      List<RoomCart> roomCart = rooms.map((room) {
        return RoomCart(
          room: room,
          isSelected: false,
          quantity: 0,
          roomPreference: roomPreference,
        );
      }).toList();
      emit(RoomCartLoaded(roomCart: roomCart));
    } catch (e) {
      print(e.toString());
      emit(RoomCartError());
    }
  }

  void updateRoomCart(RoomCart selectedRoom, RoomPreference roomPreference) {
    final int roomCartIndex = (state as RoomCartLoaded)
        .roomCart
        .indexWhere((room) => room == selectedRoom);

    final RoomCart room = (state as RoomCartLoaded).roomCart[roomCartIndex];
    room.isSelected = true;
    room.quantity = 1;
    room.roomPreference = roomPreference;

    print(room);
  }
}
