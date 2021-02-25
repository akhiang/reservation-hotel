part of 'package:dangau_hotel/screens/screens.dart';

class HotelFoodShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300],
      highlightColor: Colors.grey[200],
      child: Column(
        children: [
          Container(
            height: 200.0,
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (_, __) => Container(
                width: 160.0,
                margin: EdgeInsets.symmetric(horizontal: 8.0),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AspectRatio(
                        aspectRatio: 1.2,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                        ),
                      ),
                      SizedBox(height: 8.0),
                      ShimmerSized(width: 80.0),
                      ShimmerSized(width: 72.0),
                    ],
                  ),
                ),
              ),
            ),
          ),
          _buildOtherFoodShimmer(),
          _buildOtherFoodShimmer(),
        ],
      ),
    );
  }

  Widget _buildOtherFoodShimmer() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 12.0),
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: SizedBox(
              width: 88.0,
              child: AspectRatio(
                aspectRatio: 1.0,
                child: Container(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(width: 16.0),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ShimmerSized(width: 120.0),
                    ShimmerSized(width: 80.0),
                    SizedBox(height: 16.0),
                    ShimmerSized(width: 120.0),
                  ],
                ),
                ShimmerSized(width: 80.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
