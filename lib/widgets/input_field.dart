part of 'package:dangau_hotel/widgets/widgets.dart';

class InputField extends StatelessWidget {
  final String hint;
  final int maxLines;
  final ValueChanged<String> onChanged;
  final Function validation;
  final TextInputType keyboard;
  final Function onSubmitted;
  final FocusNode focusNode;
  final TextEditingController controller;

  const InputField({
    Key key,
    @required this.hint,
    this.maxLines = 1,
    @required this.onChanged,
    @required this.validation,
    this.keyboard = TextInputType.text,
    this.onSubmitted,
    this.focusNode,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        maxLines: maxLines,
        controller: controller,
        focusNode: focusNode,
        validator: validation,
        onChanged: onChanged,
        keyboardType: keyboard,
        onFieldSubmitted: onSubmitted,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9_]+.*$')),
        ],
        decoration: new InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          border: new OutlineInputBorder(
            borderRadius: const BorderRadius.all(const Radius.circular(32.0)),
            borderSide: BorderSide.none,
          ),
          filled: true,
          hintStyle: new TextStyle(color: Colors.grey[800]),
          hintText: hint,
          fillColor: ColorConst.kSecondaryColor.withOpacity(0.05),
        ),
      ),
    );
  }
}
