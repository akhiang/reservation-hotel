part of 'package:dangau_hotel/screens/screens.dart';

class HotelListCard extends StatelessWidget {
  const HotelListCard({
    Key key,
    @required this.hotel,
  }) : super(key: key);

  final Hotel hotel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.of(context, rootNavigator: true).push(
        //   MaterialPageRoute(
        //     builder: (context) => HotelScreen(
        //       hotel: hotel,
        //     ),
        //   ),
        // );
        Navigator.pushNamed(context, HotelScreen.routeName, arguments: hotel);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: SizedBox(
                child: AspectRatio(
                  aspectRatio: 1.6,
                  child: Image.network(
                    hotel.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 16.0,
              bottom: 16.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${hotel.name}'.titleCase,
                    maxLines: 2,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.2,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  RatingBarIndicator(
                    rating: hotel.hotelRating.rating,
                    itemCount: 5,
                    itemSize: 16.0,
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
