part of 'package:dangau_hotel/screens/screens.dart';

class OtpInputField extends StatelessWidget {
  final ValueChanged<String> onChanged;

  const OtpInputField({
    Key key,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 24.0, horizontal: 4.0),
      padding: EdgeInsets.symmetric(horizontal: 24.0),
      width: 40.0,
      height: 48.0,
      decoration: BoxDecoration(
        color: ColorConst.kSecondaryColor.withOpacity(0.05),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: TextFormField(
        onChanged: onChanged,
        style: TextStyle(color: ColorConst.kSecondaryColor),
        cursorColor: ColorConst.kSecondaryColor,
        decoration: InputDecoration(
          border: InputBorder.none,
        ),
      ),
    );
  }
}
