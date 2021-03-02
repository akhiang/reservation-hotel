part of 'package:dangau_hotel/widgets/widgets.dart';

class InfoDialog extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final String buttonText;
  final Function press;

  const InfoDialog({
    Key key,
    this.icon,
    this.title,
    this.description,
    this.buttonText,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 24.0),
      decoration: new BoxDecoration(
        color: ColorConst.kThirdColor,
        boxShadow: [kShadow],
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(icon, color: ColorConst.kPrimaryColor, size: 56.0),
          title != null ? Text(title, style: kLargeBoldTextStyle) : SizedBox(),
          SizedBox(height: 24.0),
          description != null
              ? Text(description,
                  textAlign: TextAlign.center, style: kNormalTextStyle)
              : SizedBox(),
          SizedBox(height: 24.0),
          PrimaryButton(
            text: buttonText,
            color: ColorConst.kSuccessColor,
            textColor: ColorConst.kThirdColor,
            press: press,
          ),
        ],
      ),
    );
  }
}
