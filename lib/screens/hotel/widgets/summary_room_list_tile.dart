part of 'package:dangau_hotel/screens/screens.dart';

class SummaryRoomListTile extends StatelessWidget {
  const SummaryRoomListTile({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Deluxe King, with Balcony',
              ),
              SizedBox(height: 4.0),
              Text(
                '3 malam, 1 kamar',
              )
            ],
          ),
          Text('Rp2100000', style: kNormalBoldTextStyle),
        ],
      ),
    );
  }
}
