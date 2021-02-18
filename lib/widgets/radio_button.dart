part of 'package:dangau_hotel/widgets/widgets.dart';

class RadioButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final value;
  final radioValue;
  final Function tap;
  final Function change;

  const RadioButton({
    Key key,
    @required this.title,
    @required this.icon,
    @required this.value,
    @required this.radioValue,
    this.tap,
    this.change,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 12.0),
        color: ColorConst.kThirdColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon, color: ColorConst.kErrorColor),
                SizedBox(width: 16.0),
                Text(title, style: kNormalBoldTextStyle),
              ],
            ),
            SizedBox(
              width: 20.0,
              height: 20.0,
              child: Radio(
                value: radioValue,
                groupValue: value,
                onChanged: change,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
