part of 'package:dangau_hotel/screens/screens.dart';

class OrderRoomDetail extends StatelessWidget {
  final RoomCart selectedRoom;

  const OrderRoomDetail({Key key, @required this.selectedRoom})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateState dateState = context.watch<DateCubit>().state;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
                '${selectedRoom.room.name}, ${selectedRoom.room.variant}'
                    .titleCase,
                style: kNormalBoldTextStyle),
            Icon(Icons.info, color: ColorConst.kSecondaryColor)
          ],
        ),
        SizedBox(height: 8.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Jumlah kamar', style: kNormalTextStyle),
            Text('${selectedRoom.quantity}', style: kNormalBoldTextStyle),
          ],
        ),
        SizedBox(height: 4.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Lama waktu inap', style: kNormalTextStyle),
            Text('${dateState.rangeNight} Malam', style: kNormalBoldTextStyle),
          ],
        ),
        SizedBox(height: 4.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Harga/malam', style: kNormalTextStyle),
            Text(
                NumberFormat.currency(
                        locale: 'id', symbol: 'Rp', decimalDigits: 0)
                    .format(selectedRoom.room.price),
                style: kNormalBoldTextStyle),
          ],
        ),
        SizedBox(height: 4.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Sub-Total', style: kNormalTextStyle),
            Text(
                NumberFormat.currency(
                        locale: 'id', symbol: 'Rp', decimalDigits: 0)
                    .format(selectedRoom.quantity * selectedRoom.room.price),
                style: kNormalBoldTextStyle),
          ],
        ),
      ],
    );
  }
}
