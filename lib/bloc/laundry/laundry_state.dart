part of 'laundry_bloc.dart';

abstract class LaundryState extends Equatable {
  const LaundryState();
  
  @override
  List<Object> get props => [];
}

class LaundryInitial extends LaundryState {}
