part of 'package:dangau_hotel/screens/screens.dart';

class HotelCarousel extends StatelessWidget {
  const HotelCarousel({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        //   child: Text(
        //     'Hotel',
        //     style: TextStyle(
        //       color: ColorConst.kSecondaryColor,
        //       fontSize: 24.0,
        //       fontWeight: FontWeight.w700,
        //       letterSpacing: 1.2,
        //     ),
        //   ),
        // ),
        Container(
          height: 150.0,
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            scrollDirection: Axis.horizontal,
            itemCount: hotels.length,
            itemBuilder: (_, index) {
              Hotel hotel = hotels[index];
              return GestureDetector(
                onTap: () {
                  Navigator.of(context, rootNavigator: true).push(
                    MaterialPageRoute(
                      builder: (context) => HotelScreen5(
                        hotel: hotel,
                      ),
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16.0),
                        child: Image.network(
                          hotel.imageUrl,
                          fit: BoxFit.cover,
                        ),
                        //     child: Image.network(
                        //   food.imageUrl,
                        //   fit: BoxFit.cover,
                        // ),
                      ),
                      Positioned(
                        left: 16.0,
                        bottom: 16.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              hotel.name,
                              maxLines: 2,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1.2,
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              '⭐⭐⭐⭐⭐',
                              style: TextStyle(
                                fontSize: 10.0,
                                letterSpacing: 1.2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
