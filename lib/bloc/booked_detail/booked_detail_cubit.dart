import 'package:bloc/bloc.dart';
import 'package:dangau_hotel/models/models.dart';
import 'package:dangau_hotel/services/services.dart';
import 'package:equatable/equatable.dart';

part 'booked_detail_state.dart';

class BookedDetailCubit extends Cubit<BookedDetailState> {
  final BookingService _bookingService;

  BookedDetailCubit(this._bookingService) : super(BookedDetailInitial());

  Future<void> getBookedDetail(int id) async {
    emit(BookedDetailLoading());
    try {
      final ApiResponse<Booking> bookedDetailResponse =
          await _bookingService.getBooking(id);
      emit(BookedDetailLoaded(booking: bookedDetailResponse.data));
    } catch (error) {
      print('booked detail ' + error.toString());
      emit(BookedDetailError());
    }
  }
}
