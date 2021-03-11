import 'package:bloc/bloc.dart';
import 'package:dangau_hotel/models/models.dart';
import 'package:dangau_hotel/services/services.dart';
import 'package:equatable/equatable.dart';

part 'booked_state.dart';

class BookedCubit extends Cubit<BookedState> {
  final BookingService _bookingService;

  BookedCubit(this._bookingService) : super(BookedInitial());

  Future<void> getBookedList() async {
    emit(BookedLoading());
    try {
      final ApiResponse<List<Booking>> bookingResponse =
          await _bookingService.getBookings();
      List<Booking> bookings = bookingResponse.data;
      emit(BookedLoaded(bookings: bookings));
    } catch (error) {
      print(error);
      emit(BookedError());
    }
  }
}
