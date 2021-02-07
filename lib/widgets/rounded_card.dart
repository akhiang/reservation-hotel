part of 'package:dangau_hotel/screens/screens.dart';

class RoundedCard extends StatelessWidget {
  final IconData icon;
  final IconData trailingIcon;
  final String title;
  final String subtitle;
  final Function press;

  const RoundedCard({
    Key key,
    this.icon,
    this.trailingIcon = Icons.chevron_right,
    @required this.title,
    this.subtitle,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 0.0),
      child: Container(
        height: 56.0,
        width: double.infinity,
        decoration: BoxDecoration(
          color: ColorConst.kThirdColor,
          boxShadow: [kShadow],
          borderRadius: BorderRadius.circular(32.0),
        ),
        child: Material(
          borderRadius: BorderRadius.circular(32.0),
          clipBehavior: Clip.hardEdge,
          color: Colors.transparent,
          child: InkWell(
            onTap: press,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      icon == null
                          ? SizedBox()
                          : Icon(icon, color: ColorConst.kErrorColor),
                      SizedBox(width: 8.0),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: title,
                              style: kSmallBoldTextStyle,
                            ),
                            TextSpan(
                              text: subtitle,
                              style: kSmallTextStyle,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      trailingIcon == null
                          ? SizedBox()
                          : Icon(
                              trailingIcon,
                              color: ColorConst.kSecondaryColor,
                            ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
