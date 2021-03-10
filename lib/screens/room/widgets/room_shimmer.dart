part of 'package:dangau_hotel/screens/screens.dart';

class RoomShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300],
        highlightColor: Colors.grey[200],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: SizeConfig.screenHeight(context) * 0.4,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.0),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
              child: Column(
                children: [
                  ShimmerSingleColumn(),
                  ShimmerSingleColumn(),
                  SizedBox(height: 8.0),
                  ShimmerSized(width: 120.0),
                  SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildFacilityShimmer(),
                      _buildFacilityShimmer(),
                      _buildFacilityShimmer(),
                      _buildFacilityShimmer(),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  ShimmerSingleColumn(),
                  ShimmerSingleColumn(),
                  ShimmerSingleColumn(),
                  ShimmerSingleColumn(),
                  ShimmerSingleColumn(),
                  ShimmerSingleColumn(),
                  ShimmerSingleColumn(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFacilityShimmer() {
    return Container(
      height: 58.0,
      width: 58.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
      ),
    );
  }
}
