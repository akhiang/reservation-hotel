part of 'package:dangau_hotel/screens/screens.dart';

class FacilityCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final double size;

  const FacilityCard({
    Key key,
    @required this.icon,
    @required this.title,
    this.size = 24.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 58.0,
          height: 58.0,
          child: Icon(
            icon,
            size: size,
            color: ColorConst.kThirdColor,
          ),
          decoration: BoxDecoration(
            color: ColorConst.kPrimaryColor,
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
        SizedBox(height: 8.0),
        Text(
          title,
          style: TextStyle(
            color: ColorConst.kSecondaryColor,
            fontSize: 12.0,
          ),
        )
      ],
    );
  }
}
