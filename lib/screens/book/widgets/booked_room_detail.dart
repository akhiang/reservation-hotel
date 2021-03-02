part of 'package:dangau_hotel/screens/screens.dart';

class BookedRoomDetail extends StatelessWidget {
  const BookedRoomDetail({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // GlobalKey _toolTipKey = GlobalKey();

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
                  style: kNormalBoldTextStyle,
                ),
                // Tooltip(
                //   key: _toolTipKey,
                //   message: 'Lorem ipsum dolor sit amet, consectetur '
                //       'adipiscing elit, sed do eiusmod tempor incididunt '
                //       'ut labore et dolore magna aliqua. '
                //       'Ut enim ad minim veniam, quis nostrud exercitation '
                //       'ullamco laboris nisi ut aliquip ex ea commodo consequat',
                //   padding: EdgeInsets.all(16.0),
                //   margin: EdgeInsets.only(top: 8.0, left: 40.0, right: 24.0),
                //   showDuration: Duration(seconds: 10),
                //   decoration: BoxDecoration(
                //     color: ColorConst.kThirdColor,
                //     borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                //     boxShadow: [
                //       BoxShadow(
                //         color: ColorConst.kSecondaryColor.withOpacity(0.15),
                //         offset: Offset(0.0, 5.0),
                //         blurRadius: 20.0,
                //       ),
                //     ],
                //   ),
                //   textStyle: TextStyle(color: ColorConst.kSecondaryColor),
                //   preferBelow: true,
                //   verticalOffset: 30,
                //   child: GestureDetector(
                //     onTap: () {
                //       final dynamic tooltip = _toolTipKey.currentState;
                //       tooltip.ensureTooltipVisible();
                //     },
                //     child: Icon(
                //       Icons.info,
                //       color: ColorConst.kSecondaryColor,
                //     ),
                //   ),
                // ),
              ],
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Jam Check-in',
                  style: kNormalTextStyle,
                ),
                Text(
                  '14.00 - 23.59',
                  style: kNormalBoldTextStyle,
                ),
              ],
            ),
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Jam Check-out',
                  style: kNormalTextStyle,
                ),
                Text(
                  '01.00 - 12.00',
                  style: kNormalBoldTextStyle,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Divider(
                color: ColorConst.kSecondaryColor.withOpacity(0.5),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Terbayarkan',
                  style: kNormalTextStyle,
                ),
                Text(
                  Helper.priceFormat(1470000),
                  style: kNormalBoldTextStyle,
                ),
              ],
            ),
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Bayar di tempat',
                  style: kNormalTextStyle,
                ),
                Text(
                  Helper.priceFormat(2730000),
                  style: kNormalBoldTextStyle,
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
