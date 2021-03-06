part of 'package:dangau_hotel/screens/screens.dart';

class OtherFoodCard extends StatelessWidget {
  const OtherFoodCard({
    Key key,
    @required this.food,
  }) : super(key: key);

  final Food food;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12.0),
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
                child: Image.network(
                  food.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(width: 16.0),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${food.name}',
                  style: TextStyle(
                    color: ColorConst.kSecondaryColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(height: 2.0),
                Text(
                  '${Helper.priceFormat(food.price.toDouble())}',
                  style: kNormalTextStyle,
                ),
                // Text(
                //   '${food.description}',
                //   overflow: TextOverflow.ellipsis,
                //   style: TextStyle(
                //     color: ColorConst.kSecondaryColor,
                //     fontSize: 12.0,
                //   ),
                // ),
                SizedBox(height: 24.0),
                Text(
                  '⭐⭐⭐⭐⭐',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 12.0,
                    letterSpacing: 1.2,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
