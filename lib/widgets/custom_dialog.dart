part of 'package:dangau_hotel/screens/screens.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final String description;
  final String firstButtonText;
  final String secondButtonText;
  final Function firstButtonPress;
  final Function secondButtonPress;

  CustomDialog({
    @required this.title,
    @required this.description,
    @required this.firstButtonText,
    @required this.secondButtonText,
    @required this.firstButtonPress,
    @required this.secondButtonPress,
  });

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
          Icon(Icons.error_rounded,
              color: ColorConst.kPrimaryColor, size: 56.0),
          SizedBox(height: 24.0),
          Text(title, style: kLargeBoldTextStyle),
          SizedBox(height: 24.0),
          Text(description,
              textAlign: TextAlign.center, style: kNormalTextStyle),
          SizedBox(height: 24.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              PrimaryButton(
                text: firstButtonText,
                color: ColorConst.kErrorColor,
                textColor: ColorConst.kThirdColor,
                press: firstButtonPress,
              ),
              PrimaryButton(
                text: secondButtonText,
                textColor: ColorConst.kThirdColor,
                color: ColorConst.kSuccessColor,
                press: secondButtonPress,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
