part of 'package:dangau_hotel/screens/screens.dart';

class SelectedRoomCard extends StatelessWidget {
  final String title;
  final String subtitle;

  const SelectedRoomCard({Key key, this.title, this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        height: 56.0,
        width: double.infinity,
        decoration: BoxDecoration(
          color: ColorConst.kThirdColor,
          boxShadow: [kShadow],
          borderRadius: BorderRadius.circular(32.0),
        ),
        child: Row(
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: title,
                    style: kNormalBoldTextStyle,
                  ),
                  TextSpan(
                    text: subtitle,
                    style: kNormalTextStyle,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
