part of 'package:dangau_hotel/screens/screens.dart';

class HotelFood extends StatelessWidget {
  final ScrollController sc;
  final Hotel hotel;

  const HotelFood({
    Key key,
    this.sc,
    this.hotel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      controller: sc,
      child: Column(
        children: [
          _buildPopularFood(context),
        ],
      ),
    );
  }

  Padding _buildPopularFood(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          Container(
            height: 150,
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              itemCount: foods.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                Food food = foods[index];
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 8.0),
                  width: 150.0,
                  height: 150.0,
                  child: Hero(
                    tag: food.imageUrl,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: Image.network(
                        food.imageUrl,
                        height: 120.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
