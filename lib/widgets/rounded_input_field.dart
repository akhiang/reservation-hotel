part of 'package:dangau_hotel/screens/screens.dart';

class RoundedInputField extends StatelessWidget {
  final String hint;
  final ValueChanged<String> onChanged;
  const RoundedInputField({
    Key key,
    this.hint,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        onChanged: onChanged,
        style: TextStyle(color: ColorConst.kSecondaryColor),
        cursorColor: ColorConst.kSecondaryColor,
        decoration: InputDecoration(
          hintText: hint,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
