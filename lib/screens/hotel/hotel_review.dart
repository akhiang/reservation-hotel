part of 'package:dangau_hotel/screens/screens.dart';

class HotelReview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '4.8',
                  style: TextStyle(
                    color: ColorConst.kSecondaryColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 40.0,
                  ),
                ),
                SizedBox(height: 8.0),
                RatingBar.builder(
                  initialRating: 5,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 32.0,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
                SizedBox(height: 8.0),
                Text(
                  '100 Ulasan',
                  style: TextStyle(
                    color: ColorConst.kSecondaryColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('5 Stars'),
                SizedBox(
                  width: 250.0,
                  child: StepProgressIndicator(
                    totalSteps: 100,
                    currentStep: 80,
                    size: 5,
                    padding: 0,
                    selectedColor: ColorConst.kPrimaryColor,
                    unselectedColor: Color(0xFFF5F9FF),
                    roundedEdges: Radius.circular(12.0),
                  ),
                ),
                Text('80'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
