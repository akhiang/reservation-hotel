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

  Future<void> getHotelRoomsToCart(SearchRoomRequest searchRoomRequest) async {
    emit(RoomCartLoading());
    try {
      final ApiResponse<List<RoomType>> roomResponse =
          await _roomService.getRooms(searchRoomRequest);
      List<RoomType> rooms = roomResponse.data;
      List<RoomCart> roomCart = rooms.map((room) {
        return RoomCart(
          id: room.id,
          room: room,
          quantity: 0,
          roomPreference: roomPreference,
        );
      }).toList();
      List<RoomCart> selectedRoomCart = [];
      emit(RoomCartLoaded(
          roomCart: roomCart, selectedRoomCart: selectedRoomCart));
    } catch (e) {
      print('room cart ' + e.toString());
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

    List<RoomCart> selectedRoomCart = filterSelectedRoomInCart(updatedRoomCart);
    double total = sumSelectedRoomPriceTotal(selectedRoomCart);

    emit(RoomCartLoaded(
        roomCart: updatedRoomCart,
        selectedRoomCart: selectedRoomCart,
        total: total));
  }

  void decrementRoomCartQuantity(int roomCartId) {
    final List<RoomCart> updatedRoomCart =
        (state as RoomCartLoaded).roomCart.map((room) {
      return room.id == roomCartId
          ? room.copyWith(quantity: room.quantity - 1)
          : room;
    }).toList();

    List<RoomCart> selectedRoomCart = filterSelectedRoomInCart(updatedRoomCart);
    double total = sumSelectedRoomPriceTotal(selectedRoomCart);

    emit(RoomCartLoaded(
        roomCart: updatedRoomCart,
        selectedRoomCart: selectedRoomCart,
        total: total));
  }

  void incrementRoomCartQuantity(int roomCartId) {
    final List<RoomCart> updatedRoomCart =
        (state as RoomCartLoaded).roomCart.map((room) {
      return room.id == roomCartId
          ? room.copyWith(quantity: room.quantity + 1)
          : room;
    }).toList();

    List<RoomCart> selectedRoomCart = filterSelectedRoomInCart(updatedRoomCart);
    double total = sumSelectedRoomPriceTotal(selectedRoomCart);

    emit(RoomCartLoaded(
        roomCart: updatedRoomCart,
        selectedRoomCart: selectedRoomCart,
        total: total));
  }

  List<RoomCart> filterSelectedRoomInCart(List<RoomCart> roomCart) {
    final List<RoomCart> selectedRoomCart =
        roomCart.where((room) => room.quantity > 0).toList();

    return selectedRoomCart;
  }

  double sumSelectedRoomPriceTotal(List<RoomCart> selectedRoomCart) {
    double total = selectedRoomCart.fold(
        0, (sum, item) => sum + (item.quantity * item.room.price));

    return total;
  }
}
