part of 'package:dangau_hotel/models/models.dart';

class RoomPreference {
  bool isSmoke;
  bool isSingleBed;
  String note;

  RoomPreference({
    this.isSmoke,
    this.isSingleBed,
    this.note,
  });

  Map<String, dynamic> toJson() => {
        'is_smoke': this.isSmoke,
        'is_single_bed': this.isSingleBed,
        'note': this.note,
      };

  // @override
  // List<Object> get props => [isSmoke, isSingleBed];

  @override
  String toString() =>
      'RoomPreference { smoke: $isSmoke, singleBed: $isSingleBed, note: $note }';
}
