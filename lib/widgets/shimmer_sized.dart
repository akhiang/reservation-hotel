part of 'package:dangau_hotel/widgets/widgets.dart';

class ShimmerSized extends StatelessWidget {
  final double width;

  const ShimmerSized({
    Key key,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6.0),
      width: width,
      height: 12.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
      ),
    );
  }
}
