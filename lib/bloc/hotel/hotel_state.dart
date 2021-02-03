part of 'hotel_bloc.dart';

@immutable
abstract class HotelState {}

class HotelInitial extends HotelState {}

class HotelLoaded extends HotelState {
  final List<Hotel> hotels;

  HotelLoaded(this.hotels);

  @override
  List<Object> get props => [hotels];
}

class HotelError extends HotelState {}
