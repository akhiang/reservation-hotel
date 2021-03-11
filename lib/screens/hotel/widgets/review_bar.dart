part of 'package:dangau_hotel/screens/screens.dart';

class ReviewBar extends StatelessWidget {
  final String title;
  final int score;

  const ReviewBar({
    Key key,
    @required this.title,
    @required this.score,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 64.0,
            child: Text(
              '$title Stars',
              style: TextStyle(
                color: ColorConst.kSecondaryColor,
                fontWeight: FontWeight.w600,
                fontSize: 16.0,
              ),
            ),
          ),
          SizedBox(width: 24.0),
          Expanded(
            child: StepProgressIndicator(
              totalSteps: 100,
              currentStep: score,
              size: 6.0,
              padding: 0,
              selectedColor: ColorConst.kPrimaryColor,
              unselectedColor: Color(0xFFDCDCDC),
              roundedEdges: Radius.circular(12.0),
            ),
          ),
          SizedBox(width: 12.0),
          Container(
            width: 44.0,
            child: Text(
              score.toString(),
              textAlign: TextAlign.right,
              style: TextStyle(
                color: ColorConst.kSecondaryColor,
                fontWeight: FontWeight.w600,
                fontSize: 16.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
