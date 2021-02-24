part of 'package:dangau_hotel/screens/screens.dart';

class BookRoomDetailShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300],
      highlightColor: Colors.grey[200],
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ShimmerSingleColumn(),
            ShimmerSized(width: 160.0),
            ShimmerSized(width: 120.0),
            SizedBox(height: 8.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 100.0,
                  width: 100.0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  ),
                ),
                SizedBox(width: 8.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ShimmerSingleColumn(),
                      ShimmerSized(width: 100.0),
                      ShimmerSized(width: 100.0),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            ShimmerSized(width: 100.0),
            ShimmerSized(width: 100.0),
          ],
        ),
      ),
    );
  }
}
