part of 'package:dangau_hotel/screens/screens.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color color;

  const PrimaryButton({
    Key key,
    @required this.text,
    this.color = ColorConst.kPrimaryColor,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: press,
      child: Text(
        text,
        style: TextStyle(
          color: ColorConst.kSecondaryColor,
          fontWeight: FontWeight.w700,
        ),
      ),
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32.0),
      ),
    );
  }
}
