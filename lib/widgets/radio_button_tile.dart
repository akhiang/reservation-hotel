part of 'package:dangau_hotel/widgets/widgets.dart';

class RadioButtonTile extends StatelessWidget {
  final String title;
  final int value;
  final int group;
  final Function press;
  final Function onChange;

  const RadioButtonTile({
    Key key,
    this.title,
    this.value,
    this.group,
    this.press,
    this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        width: double.infinity,
        color: ColorConst.kThirdColor,
        padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: kNormalBoldTextStyle),
            SizedBox(
              width: 20.0,
              height: 20.0,
              child: Radio(
                activeColor: ColorConst.kPrimaryColor,
                value: value,
                groupValue: group,
                onChanged: onChange,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
