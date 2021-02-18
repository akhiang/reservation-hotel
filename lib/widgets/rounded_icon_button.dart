part of 'package:dangau_hotel/widgets/widgets.dart';

class RoundedIconBtn extends StatelessWidget {
  const RoundedIconBtn({
    Key key,
    @required this.icon,
    @required this.color,
    @required this.press,
    this.showShadow = false,
  }) : super(key: key);

  final IconData icon;
  final Color color;
  final GestureTapCancelCallback press;
  final bool showShadow;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24.0,
      width: 24.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          if (showShadow)
            BoxShadow(
              offset: Offset(0, 6),
              blurRadius: 10,
              color: Color(0xFFB0B0B0).withOpacity(0.2),
            ),
        ],
      ),
      child: FlatButton(
        padding: EdgeInsets.zero,
        color: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        disabledColor: ColorConst.kSecondaryColor.withOpacity(0.4),
        onPressed: press,
        child: Icon(icon, color: ColorConst.kThirdColor),
      ),
    );
  }
}
