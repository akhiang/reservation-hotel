part of 'package:dangau_hotel/screens/screens.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  const PrimaryButton({
    Key key,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {},
      child: Text(
        text,
        style: TextStyle(
          color: ColorConst.kSecondaryColor,
          fontWeight: FontWeight.w700,
        ),
      ),
      color: ColorConst.kPrimaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32.0),
      ),
    );
  }
}