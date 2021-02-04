part of 'hotel_detail_bloc.dart';

abstract class HotelDetailState extends Equatable {
  const HotelDetailState();

  @override
  List<Object> get props => [];
}

class HotelDetailInitial extends HotelDetailState {}

class HotelDetailLoading extends HotelDetailState {}

class HotelDetailLoaded extends HotelDetailState {
  final Hotel hotel;

  const HotelDetailLoaded({this.hotel});

  HotelDetailLoaded copyWith({
    Hotel hotel,
  }) {
    return HotelDetailLoaded(
      hotel: hotel ?? this.hotel,
    );
  }
}

class HotelDetailError extends HotelDetailState {}
