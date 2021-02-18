part of 'package:dangau_hotel/widgets/widgets.dart';

class TextField extends StatelessWidget {
  final Function validation;

  const TextField({
    Key key,
    this.validation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validation,
      decoration: new InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
        border: new OutlineInputBorder(
          borderRadius: const BorderRadius.all(const Radius.circular(32.0)),
          borderSide: BorderSide.none,
        ),
        filled: true,
        hintStyle: new TextStyle(color: Colors.grey[800]),
        hintText: "Type in your text",
        fillColor: ColorConst.kSecondaryColor.withOpacity(0.05),
      ),
    );
  }
}
