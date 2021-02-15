part of 'date_cubit.dart';

class DateState extends Equatable {
  final DateTime rangeStartDate;
  final DateTime rangeEndDate;
  final int rangeNight;

  const DateState({
    @required this.rangeStartDate,
    @required this.rangeEndDate,
    @required this.rangeNight,
  });

  DateState copyWith({
    DateTime rangeStartDate,
    DateTime rangeEndDate,
    int rangeNight,
  }) {
    return DateState(
      rangeStartDate: rangeStartDate ?? this.rangeStartDate,
      rangeEndDate: rangeEndDate ?? this.rangeEndDate,
      rangeNight: rangeNight ?? this.rangeNight,
    );
  }

  @override
  List<Object> get props => [
        rangeStartDate,
        rangeEndDate,
        rangeNight,
      ];
}
