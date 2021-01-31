part of 'package:dangau_hotel/screens/screens.dart';

class VirtualAccountCard extends StatelessWidget {
  const VirtualAccountCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(16.0),
        height: 147.0,
        width: double.infinity,
        decoration: BoxDecoration(
          color: ColorConst.kThirdColor,
          boxShadow: [kShadow],
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Transfer ke BCA Virtual Account', style: kNormalTextStyle),
            Text('xxxx-xxxx-xxxx-xxxx', style: kNormalBoldTextStyle),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Total', style: kNormalTextStyle),
                Text('1617000', style: kNormalBoldTextStyle),
              ],
            )
          ],
        ));
  }
}
