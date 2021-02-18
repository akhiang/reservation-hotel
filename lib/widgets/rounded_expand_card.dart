part of 'package:dangau_hotel/widgets/widgets.dart';

class RoundedExpandCard extends StatelessWidget {
  final String title;

  const RoundedExpandCard({
    Key key,
    @required this.title,
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
            textTheme: TextTheme(subtitle1: kNormalBoldTextStyle)),
        child: ExpansionTile(
          title: Row(
            children: [
              SizedBox(width: 8.0),
              Text(title, style: kNormalBoldTextStyle),
            ],
          ),
          children: [
            Container(
              padding:
                  const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 24.0),
              alignment: Alignment.topLeft,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('+62 82569552370', style: kNormalBoldTextStyle),
                  SizedBox(height: 8.0),
                  Text('johndoe@gmail.com', style: kNormalBoldTextStyle),
                  SizedBox(height: 8.0),
                  Text('Jl. Sulawesi No. 9B', style: kNormalBoldTextStyle),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
