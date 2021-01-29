part of 'package:dangau_hotel/screens/screens.dart';

class ShadowButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function press;

  const ShadowButton({Key key, this.text, this.press, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon),
              SizedBox(width: 8.0),
              Text(
                text,
                style: TextStyle(
                  color: ColorConst.kSecondaryColor,
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
        ),
        decoration: BoxDecoration(
          color: ColorConst.kThirdColor,
          borderRadius: BorderRadius.circular(32.0),
          boxShadow: [kShadow],
        ),
      ),
    );
  }
}
