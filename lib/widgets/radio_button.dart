part of 'package:dangau_hotel/screens/screens.dart';

enum SmokeOption { smoking, nonsmoking }

class RadioButton extends StatefulWidget {
  final String title;
  final IconData icon;

  const RadioButton({
    Key key,
    @required this.title,
    @required this.icon,
  }) : super(key: key);

  @override
  _RadioButtonState createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton> {
  SmokeOption _character = SmokeOption.nonsmoking;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _character = SmokeOption.smoking;
        });
        print(_character);
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 12.0),
        color: ColorConst.kThirdColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(widget.icon, color: ColorConst.kErrorColor),
                SizedBox(width: 16.0),
                Text(widget.title, style: kNormalBoldTextStyle),
              ],
            ),
            SizedBox(
              width: 20.0,
              height: 20.0,
              child: Radio(
                value: SmokeOption.smoking,
                groupValue: _character,
                onChanged: (SmokeOption value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
