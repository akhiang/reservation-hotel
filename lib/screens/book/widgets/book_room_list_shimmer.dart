part of 'package:dangau_hotel/screens/screens.dart';

class BookRoomListShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300],
      highlightColor: Colors.grey[200],
      child: Container(
        child: ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
          physics: NeverScrollableScrollPhysics(),
          itemCount: 2,
          itemBuilder: (_, __) => Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(vertical: 8.0),
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Column(
              children: [
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
