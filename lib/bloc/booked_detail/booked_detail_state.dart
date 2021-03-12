part of 'booked_detail_cubit.dart';

abstract class BookedDetailState extends Equatable {
  const BookedDetailState();

  @override
  List<Object> get props => [];
}

class BookedDetailInitial extends BookedDetailState {}

class BookedDetailLoading extends BookedDetailState {}

class BookedDetailLoaded extends BookedDetailState {
  final Booking booking;

  const BookedDetailLoaded({this.booking});

  BookedDetailLoaded copyWith({
    Booking booking,
  }) {
    return BookedDetailLoaded(
      booking: booking ?? this.booking,
    );
  }

  @override
  List<Object> get props => [booking];
}

class BookedDetailError extends BookedDetailState {}
