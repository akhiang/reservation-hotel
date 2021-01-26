part of 'package:dangau_hotel/screens/screens.dart';

class HotelFood extends StatefulWidget {
  final ScrollController sc;
  final Hotel hotel;

  const HotelFood({
    Key key,
    this.sc,
    this.hotel,
  }) : super(key: key);

  @override
  _HotelFoodState createState() => _HotelFoodState();
}

class _HotelFoodState extends State<HotelFood> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // controller: _controller,
      child: Column(
        children: [
          _buildPopularFood(context),
          _buildOtherFood(context),
        ],
      ),
    );
  }

  Padding _buildPopularFood(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Populer",
              style: TextStyle(
                color: ColorConst.kSecondaryColor,
                fontWeight: FontWeight.w600,
                fontSize: 18.0,
                letterSpacing: 1.2,
              ),
            ),
          ),
          SizedBox(height: 8.0),
          Container(
            height: 180.0,
            child: ListView.builder(
              controller: widget.sc,
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              itemCount: foods.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                Food food = foods[index];
                return FoodCard(food: food);
              },
            ),
          ),
        ],
      ),
    );
  }
}

Padding _buildOtherFood(BuildContext context) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            "Menu Lainnya",
            style: TextStyle(
              color: ColorConst.kSecondaryColor,
              fontWeight: FontWeight.w600,
              fontSize: 18.0,
              letterSpacing: 1.2,
            ),
          ),
        ),
        Container(
          height: 500.0,
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            itemCount: foods.length,
            itemBuilder: (context, index) {
              Food food = foods[index];
              return OtherFoodCard(food: food);
            },
          ),
        ),
      ],
    ),
  );
}
