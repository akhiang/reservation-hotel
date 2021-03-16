part of 'package:dangau_hotel/screens/screens.dart';

class OrderRoomDetail extends StatefulWidget {
  final BookingDetail selectedRoom;

  const OrderRoomDetail({Key key, @required this.selectedRoom})
      : super(key: key);

  @override
  _OrderRoomDetailState createState() => _OrderRoomDetailState();
}

class _OrderRoomDetailState extends State<OrderRoomDetail> {
  void _showRoomPreferenceBottomSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Wrap(
          children: [
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: ColorConst.kThirdColor,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10.0,
                        color: Colors.black.withOpacity(0.2),
                      )
                    ],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24.0),
                      topRight: Radius.circular(24.0),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      DragIndicator(),
                      SizedBox(height: 16.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24.0, vertical: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.meeting_room,
                                    color: ColorConst.kErrorColor),
                                Text(' ${widget.selectedRoom.roomQty} Kamar',
                                    style: kNormalBoldTextStyle),
                              ],
                            ),
                            SizedBox(height: 8.0),
                            Row(
                              children: [
                                widget.selectedRoom.room.isSmoking == 1
                                    ? Text('Smoking', style: kNormalTextStyle)
                                    : Text('Non-Smoking',
                                        style: kNormalTextStyle),
                                SizedBox(width: 8.0),
                                Icon(Icons.lens,
                                    size: 8.0,
                                    color: ColorConst.kSecondaryColor
                                        .withOpacity(0.5)),
                                SizedBox(width: 8.0),
                                // widget.selectedRoom.roomPreference
                                //             .isSingleBed ==
                                //         true
                                //     ? Text('Single Bed',
                                //         style: kNormalTextStyle)
                                //     : Text('Twin Bed', style: kNormalTextStyle),
                                Text(
                                    '${widget.selectedRoom.room.bedType} bed'
                                        .titleCase,
                                    style: kNormalTextStyle),
                              ],
                            ),
                            SizedBox(height: 8.0),
                            widget.selectedRoom.note == null
                                ? SizedBox()
                                : Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Catatan',
                                          style: kNormalBoldTextStyle),
                                      SizedBox(height: 8.0),
                                      Text('${widget.selectedRoom.note}',
                                          style: kNormalTextStyle),
                                    ],
                                  ),
                            SizedBox(height: 40.0),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    DateState dateState = context.watch<DateCubit>().state;
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '${widget.selectedRoom.room.roomType.name}'
                            .titleCase,
                        style: kNormalBoldTextStyle,
                      ),
                      // TextSpan(
                      //   text: "\n${widget.selectedRoom.room.variant}".titleCase,
                      //   style: kNormalBoldTextStyle,
                      // ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  _showRoomPreferenceBottomSheet();
                },
                child: Icon(
                  Icons.info,
                  color: ColorConst.kSecondaryColor,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Jumlah kamar', style: kNormalTextStyle),
              Text('${widget.selectedRoom.roomQty}',
                  style: kNormalBoldTextStyle),
            ],
          ),
          SizedBox(height: 4.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Lama waktu inap', style: kNormalTextStyle),
              Text('${dateState.rangeNight} Malam',
                  style: kNormalBoldTextStyle),
            ],
          ),
          SizedBox(height: 4.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Harga/malam', style: kNormalTextStyle),
              Text(Helper.priceFormat(widget.selectedRoom.price),
                  style: kNormalBoldTextStyle),
            ],
          ),
          SizedBox(height: 4.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Sub-Total', style: kNormalTextStyle),
              Text(Helper.priceFormat(widget.selectedRoom.subTotal),
                  style: kNormalBoldTextStyle),
            ],
          ),
        ],
      ),
    );
  }
}
