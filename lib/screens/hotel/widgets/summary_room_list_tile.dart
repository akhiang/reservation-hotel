part of 'package:dangau_hotel/screens/screens.dart';

class SummaryRoomListTile extends StatelessWidget {
  final RoomCart selectedRoom;

  const SummaryRoomListTile({
    @required this.selectedRoom,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateState dateState = context.watch<DateCubit>().state;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '${selectedRoom.room.name}'.titleCase,
                      style: kSmallTextStyle,
                    ),
                    TextSpan(text: ' '),
                    TextSpan(
                      text: '${selectedRoom.room.variant}'.titleCase,
                      style: kSmallTextStyle,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 4.0),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '${dateState.rangeNight} malam',
                      style: kSmallTextStyle,
                    ),
                    TextSpan(text: ' '),
                    TextSpan(
                      text: '${selectedRoom.quantity} kamar',
                      style: kSmallTextStyle,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Text(
              NumberFormat.currency(
                      locale: 'id', symbol: 'Rp', decimalDigits: 0)
                  .format(dateState.rangeNight *
                      selectedRoom.quantity *
                      selectedRoom.room.price),
              style: kSmallBoldTextStyle),
        ],
      ),
    );
  }
}
