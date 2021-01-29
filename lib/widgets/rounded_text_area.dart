part of 'package:dangau_hotel/screens/screens.dart';

class RoundedTextArea extends StatelessWidget {
  final String hint;
  final int line;
  final ValueChanged<String> onChanged;

  const RoundedTextArea({
    Key key,
    this.hint,
    this.line = 1,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      borderRadius: 16.0,
      child: TextFormField(
        maxLines: line,
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