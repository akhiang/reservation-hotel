part of 'package:dangau_hotel/widgets/widgets.dart';

class ShimmerSingleColumn extends StatelessWidget {
  const ShimmerSingleColumn({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6.0),
      width: double.infinity,
      height: 12.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
      ),
    );
  }
}
