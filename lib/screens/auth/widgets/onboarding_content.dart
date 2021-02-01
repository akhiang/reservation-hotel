part of 'package:dangau_hotel/screens/screens.dart';

class OnBoardingContent extends StatelessWidget {
  final String text;

  const OnBoardingContent({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40.0),
      child: Text(
        text,
        style: TextStyle(
          color: ColorConst.kSecondaryColor,
          fontSize: 16.0,
          height: 1.4,
        ),
      ),
    );
  }
}
