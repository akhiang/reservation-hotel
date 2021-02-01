part of 'package:dangau_hotel/screens/screens.dart';

class SocialMediaLoginCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;

  const SocialMediaLoginCard({
    Key key,
    @required this.title,
    @required this.icon,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
      decoration: BoxDecoration(
        color: ColorConst.kThirdColor,
        borderRadius: BorderRadius.circular(32.0),
        boxShadow: [
          BoxShadow(
            color: ColorConst.kSecondaryColor.withOpacity(0.15),
            offset: Offset(0.0, 5.0),
            blurRadius: 20.0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: kNormalTextStyle),
          Icon(icon, color: color),
        ],
      ),
    );
  }
}
