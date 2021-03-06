part of 'package:dangau_hotel/screens/screens.dart';

class FoodCard extends StatelessWidget {
  const FoodCard({
    Key key,
    @required this.food,
  }) : super(key: key);

  final Food food;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      width: 160.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag: food.imageUrl,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: SizedBox(
                child: AspectRatio(
                  aspectRatio: 1.2,
                  child: Image.network(
                    food.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            '${food.name}',
            style: kNormalBoldTextStyle,
          ),
          Text(
            '${Helper.priceFormat(food.price.toDouble())}',
            style: TextStyle(
              color: ColorConst.kSecondaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
