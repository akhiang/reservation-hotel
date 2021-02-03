part of 'hotel_bloc.dart';

@immutable
abstract class HotelEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetHotels extends HotelEvent {}
