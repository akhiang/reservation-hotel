import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dangau_hotel/models/models.dart';
import 'package:dangau_hotel/services/services.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'hotel_event.dart';
part 'hotel_state.dart';

class HotelBloc extends Bloc<HotelEvent, HotelState> {
  HotelBloc() : super(HotelInitial());

  @override
  Stream<HotelState> mapEventToState(
    HotelEvent event,
  ) async* {
    if (event is GetHotels) {
      List<Hotel> hotels = await HotelService().getHotels();

      yield HotelLoaded(hotels);
    }
  }
}
