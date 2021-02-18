part of 'package:dangau_hotel/widgets/widgets.dart';

class RoundedExpandRadioCard extends StatelessWidget {
  final String title;
  final Widget radioList;

  const RoundedExpandRadioCard({
    Key key,
    @required this.title,
    @required this.radioList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorConst.kThirdColor,
        boxShadow: [kShadow],
        borderRadius: BorderRadius.circular(32.0),
      ),
      child: Theme(
        data: ThemeData(
          dividerColor: Colors.transparent,
          unselectedWidgetColor: ColorConst.kSecondaryColor,
          selectedRowColor: ColorConst.kSecondaryColor,
          textSelectionColor: ColorConst.kSecondaryColor,
          accentColor: ColorConst.kSecondaryColor,
          textTheme: TextTheme(subtitle1: kNormalBoldTextStyle),
        ),
        child: ExpansionTile(
          title: Row(
            children: [
              SizedBox(width: 8.0),
              Text(title, style: kNormalBoldTextStyle),
            ],
          ),
          children: [radioList],
        ),
      ),
    );
  }
}
