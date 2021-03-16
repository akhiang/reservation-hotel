import 'package:bloc/bloc.dart';
import 'package:dangau_hotel/models/models.dart';
import 'package:dangau_hotel/services/services.dart';
import 'package:equatable/equatable.dart';

part 'room_detail_state.dart';

class RoomDetailCubit extends Cubit<RoomDetailState> {
  final RoomService _roomService;

  RoomDetailCubit(this._roomService) : super(RoomDetailInitial());

  Future<void> getRoomDetail(int id) async {
    emit(RoomDetailLoading());
    try {
      final ApiResponse<RoomType> roomDetailResponse =
          await _roomService.getRoom(id);
      print(roomDetailResponse);
      emit(RoomDetailLoaded(room: roomDetailResponse.data));
    } catch (error) {
      print('room detail ' + error.toString());
      emit(RoomDetailError());
    }
  }
}
