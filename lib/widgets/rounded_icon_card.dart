part of 'package:dangau_hotel/widgets/widgets.dart';

class RoundedIconCard extends StatelessWidget {
  final String title;
  final Function press;
  final IconData trailingIcon;

  const RoundedIconCard({
    Key key,
    this.title,
    this.press,
    this.trailingIcon,
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
                      Text(title, style: kNormalBoldTextStyle),
                    ],
                  ),
                  trailingIcon == null
                      ? SizedBox()
                      : Icon(
                          trailingIcon,
                          color: ColorConst.kSecondaryColor,
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
