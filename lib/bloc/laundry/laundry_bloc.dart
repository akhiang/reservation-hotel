import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'laundry_event.dart';
part 'laundry_state.dart';

class LaundryBloc extends Bloc<LaundryEvent, LaundryState> {
  LaundryBloc() : super(LaundryInitial());

  @override
  Stream<LaundryState> mapEventToState(
    LaundryEvent event,
  ) async* {}
}
