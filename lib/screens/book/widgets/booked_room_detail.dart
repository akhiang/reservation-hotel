part of 'package:dangau_hotel/screens/screens.dart';

class BookedRoomDetail extends StatelessWidget {
  const BookedRoomDetail({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Deluxe Twin, with Balcony',
                  style: TextStyle(
                    color: ColorConst.kSecondaryColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 16.0,
                  ),
                ),
                Tooltip(
                  message: 'My Account',
                  child: Icon(
                    Icons.info,
                    color: ColorConst.kSecondaryColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Jam Check-in',
                  style: TextStyle(
                    color: ColorConst.kSecondaryColor,
                    fontSize: 16.0,
                  ),
                ),
                Text(
                  '14.00 - 23.59',
                  style: TextStyle(
                    color: ColorConst.kSecondaryColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Jam Check-out',
                  style: TextStyle(
                    color: ColorConst.kSecondaryColor,
                    fontSize: 16.0,
                  ),
                ),
                Text(
                  '01.00 - 12.00',
                  style: TextStyle(
                    color: ColorConst.kSecondaryColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Divider(
                color: ColorConst.kSecondaryColor,
                thickness: 1.0,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Terbayarkan',
                  style: TextStyle(
                    color: ColorConst.kSecondaryColor,
                    fontSize: 16.0,
                  ),
                ),
                Text(
                  '1470000',
                  style: TextStyle(
                    color: ColorConst.kSecondaryColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Bayar di tempat',
                  style: TextStyle(
                    color: ColorConst.kSecondaryColor,
                    fontSize: 16.0,
                  ),
                ),
                Text(
                  '2730000',
                  style: TextStyle(
                    color: ColorConst.kSecondaryColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}
