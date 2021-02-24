part of 'package:dangau_hotel/widgets/widgets.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color color;
  final Color textColor;
  final double radius;

  const PrimaryButton({
    Key key,
    @required this.text,
    this.color = ColorConst.kPrimaryColor,
    this.textColor = ColorConst.kSecondaryColor,
    this.press,
    this.radius = 32.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: press,
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.w600,
        ),
      ),
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }
}
