import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dangau_hotel/models/models.dart';
import 'package:dangau_hotel/services/services.dart';
import 'package:equatable/equatable.dart';

part 'hotel_detail_event.dart';
part 'hotel_detail_state.dart';

class HotelDetailBloc extends Bloc<HotelDetailEvent, HotelDetailState> {
  final HotelService _hotelService;

  HotelDetailBloc(this._hotelService) : super(HotelDetailInitial());

  @override
  Stream<HotelDetailState> mapEventToState(
    HotelDetailEvent event,
  ) async* {
    if (event is GetHotelDetail) {
      yield HotelDetailLoading();
      try {
        final ApiResponse<Hotel> hotelResponse =
            await _hotelService.getHotel(event.hotelId);
        print(hotelResponse.data);
        yield HotelDetailLoaded(hotel: hotelResponse.data);
      } catch (e) {
        print('bloc' + e.toString());
        yield HotelDetailError();
      }
    }
  }
}
