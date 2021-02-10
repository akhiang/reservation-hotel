import 'package:bloc/bloc.dart';
import 'package:dangau_hotel/models/models.dart';
import 'package:dangau_hotel/services/services.dart';
import 'package:equatable/equatable.dart';

part 'room_cart_state.dart';

class RoomCartCubit extends Cubit<RoomCartState> {
  final RoomService _roomService;

  RoomCartCubit(this._roomService) : super(RoomCartInitial());

  RoomPreference roomPreference = RoomPreference(
    isSmoke: false,
    isSingleBed: false,
    note: '',
  );

  Future<void> getHotelRoomsToCart(int hotelId) async {
    emit(RoomCartLoading());
    try {
      final List<Room> rooms = await _roomService.getRooms(hotelId);
      List<RoomCart> roomCart = rooms.map((room) {
        return RoomCart(
          id: room.id,
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
    final List<RoomCart> updatedRoomCart =
        (state as RoomCartLoaded).roomCart.map((room) {
      return room == selectedRoom
          ? room.copyWith(
              isSelected: true, quantity: 1, roomPreference: roomPreference)
          : room;
    }).toList();

    emit(RoomCartLoaded(roomCart: updatedRoomCart));
  }

  void decrementRoomCartQuantity(int roomCartId) {
    final List<RoomCart> updatedRoomCart =
        (state as RoomCartLoaded).roomCart.map((room) {
      return room.id == roomCartId
          ? room.copyWith(quantity: room.quantity - 1)
          : room;
    }).toList();

    emit(RoomCartLoaded(roomCart: updatedRoomCart));
  }

  void incrementRoomCartQuantity(int roomCartId) {
    final List<RoomCart> updatedRoomCart =
        (state as RoomCartLoaded).roomCart.map((room) {
      return room.id == roomCartId
          ? room.copyWith(quantity: room.quantity + 1)
          : room;
    }).toList();

    emit(RoomCartLoaded(roomCart: updatedRoomCart));
  }
}
