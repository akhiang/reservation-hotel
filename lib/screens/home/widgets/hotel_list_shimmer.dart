part of 'package:dangau_hotel/screens/screens.dart';

class HotelListShimmer extends StatefulWidget {
  @override
  _HotelListShimmerState createState() => _HotelListShimmerState();
}

class _HotelListShimmerState extends State<HotelListShimmer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300],
        highlightColor: Colors.grey[100],
        enabled: true,
        child: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          scrollDirection: Axis.horizontal,
          itemCount: 4,
          itemBuilder: (_, __) => Row(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 8.0),
                child: AspectRatio(
                  aspectRatio: 1.6,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
