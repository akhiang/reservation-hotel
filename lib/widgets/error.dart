part of 'package:dangau_hotel/widgets/widgets.dart';

class Error extends StatelessWidget {
  final Function press;

  const Error({
    Key key,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Maaf, terjadi kesalahan',
          style: kNormalBoldTextStyle,
        ),
        SizedBox(height: 8.0),
        PrimaryButton(
          text: 'Muat ulang',
          radius: 8.0,
          press: press,
        )
      ],
    );
  }
}
