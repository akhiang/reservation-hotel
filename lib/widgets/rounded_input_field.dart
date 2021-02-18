part of 'package:dangau_hotel/widgets/widgets.dart';

class RoundedInputField extends StatelessWidget {
  final String hint;
  final ValueChanged<String> onChanged;
  final Function validation;

  const RoundedInputField({
    Key key,
    @required this.hint,
    @required this.onChanged,
    @required this.validation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        onChanged: onChanged,
        validator: validation,
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
