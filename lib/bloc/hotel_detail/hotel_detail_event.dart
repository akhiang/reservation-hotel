part of 'hotel_detail_bloc.dart';

abstract class HotelDetailEvent extends Equatable {
  const HotelDetailEvent();

  @override
  List<Object> get props => [];
}

class GetHotelDetail extends HotelDetailEvent {
  final int hotelId;

  GetHotelDetail(this.hotelId);
}
