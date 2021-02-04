part of 'hotel_bloc.dart';

@immutable
abstract class HotelState {
  const HotelState();
}

class HotelInitial extends HotelState {}

class HotelLoading extends HotelState {}

class HotelLoaded extends HotelState {
  final List<Hotel> hotels;

  const HotelLoaded({this.hotels});

  HotelLoaded copyWith({
    List<Hotel> hotels,
  }) {
    return HotelLoaded(
      hotels: hotels ?? this.hotels,
    );
  }
}

class HotelError extends HotelState {}
