part of 'booked_cubit.dart';

abstract class BookedState extends Equatable {
  const BookedState();

  @override
  List<Object> get props => [];
}

class BookedInitial extends BookedState {}

class BookedLoading extends BookedState {}

class BookedLoaded extends BookedState {
  final List<Booking> bookings;

  const BookedLoaded({
    this.bookings,
  });

  BookedLoaded copyWith({
    List<Booking> bookings,
  }) {
    return BookedLoaded(
      bookings: bookings ?? this.bookings,
    );
  }

  @override
  List<Object> get props => [bookings];
}

class BookedError extends BookedState {}
