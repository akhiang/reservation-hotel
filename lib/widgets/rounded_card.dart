part of 'package:dangau_hotel/screens/screens.dart';

class RoundedCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function press;

  const RoundedCard({
    Key key,
    @required this.icon,
    @required this.title,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
      child: Container(
        height: 56.0,
        width: double.infinity,
        decoration: BoxDecoration(
          color: ColorConst.kThirdColor,
          boxShadow: [
            BoxShadow(
              color: ColorConst.kSecondaryColor.withOpacity(0.07),
              offset: Offset(0.0, 5.0),
              blurRadius: 20.0,
            ),
          ],
          borderRadius: BorderRadius.circular(32.0),
        ),
        child: Material(
          borderRadius: BorderRadius.circular(32.0),
          clipBehavior: Clip.hardEdge,
          color: Colors.transparent,
          child: InkWell(
            onTap: press,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      icon != null
                          ? Icon(icon, color: ColorConst.kSecondaryColor)
                          : SizedBox(),
                      SizedBox(width: 16.0),
                      Text(
                        title,
                        style: TextStyle(
                          color: ColorConst.kSecondaryColor,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.chevron_right,
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
