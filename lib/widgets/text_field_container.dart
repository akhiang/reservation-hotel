part of 'package:dangau_hotel/widgets/widgets.dart';

class TextFieldContainer extends StatelessWidget {
  final double borderRadius;
  final Widget child;

  const TextFieldContainer({
    Key key,
    this.borderRadius = 32.0,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      padding: EdgeInsets.symmetric(horizontal: 24.0),
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorConst.kSecondaryColor.withOpacity(0.05),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: child,
    );
  }
}
