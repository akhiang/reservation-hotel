part of 'package:dangau_hotel/screens/screens.dart';

class HotelReviewShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300],
      highlightColor: Colors.grey[200],
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Column(
          children: [
            ShimmerSized(width: 64.0),
            SizedBox(height: 8.0),
            ShimmerSized(width: 160.0),
            SizedBox(height: 8.0),
            ShimmerSized(width: 96.0),
            SizedBox(height: 8.0),
            ShimmerSingleColumn(),
            ShimmerSingleColumn(),
            ShimmerSingleColumn(),
            ShimmerSingleColumn(),
            ShimmerSingleColumn(),
          ],
        ),
      ),
    );
  }
}
