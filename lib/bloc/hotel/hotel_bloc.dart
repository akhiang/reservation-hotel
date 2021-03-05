import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dangau_hotel/models/models.dart';
import 'package:dangau_hotel/services/services.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'hotel_event.dart';
part 'hotel_state.dart';

class HotelBloc extends Bloc<HotelEvent, HotelState> {
  final HotelService _hotelService;

  HotelBloc(this._hotelService) : super(HotelInitial());

  @override
  Stream<HotelState> mapEventToState(
    HotelEvent event,
  ) async* {
    if (event is GetHotels) {
      yield HotelLoading();
      try {
        final ApiResponse<HotelResponse> hotelResponse =
            await _hotelService.getHotels();
        List<Hotel> hotels = hotelResponse.data.hotels;
        yield HotelLoaded(hotels: hotels);
      } catch (error) {
        print('bloc ' + error.toString());
        yield HotelError();
      }
    }
  }
}
