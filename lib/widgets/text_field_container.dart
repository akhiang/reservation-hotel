part of 'package:dangau_hotel/screens/screens.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 4.0),
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorConst.kSecondaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(32.0),
      ),
      child: child,
    );
  }
}
