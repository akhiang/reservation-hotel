part of 'package:dangau_hotel/screens/screens.dart';

class HotelInformationShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300],
        highlightColor: Colors.grey[200],
        enabled: true,
        child: Column(
          children: [
            ShimmerSingleColumn(),
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
