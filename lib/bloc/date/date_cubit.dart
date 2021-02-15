import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'date_state.dart';

class DateCubit extends Cubit<DateState> {
  DateCubit()
      : super(DateState(
          rangeStartDate: DateTime.now(),
          rangeEndDate: DateTime.now().add(Duration(days: 1)),
          rangeNight: 2,
        ));

  void changeRangeDate(DateTime startDate, DateTime endDate) {
    if (endDate == null) endDate = startDate;
    int night = endDate.difference(startDate).inDays + 1;
    emit(state.copyWith(
        rangeStartDate: startDate, rangeEndDate: endDate, rangeNight: night));
  }
}
