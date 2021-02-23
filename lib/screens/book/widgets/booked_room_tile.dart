part of 'package:dangau_hotel/screens/screens.dart';

class BookedRoomTile extends StatelessWidget {
  const BookedRoomTile({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(16.0)),
                child: SizedBox(
                  width: 98.0,
                  child: AspectRatio(
                    aspectRatio: 1.0,
                    child: Image(
                      image:
                          AssetImage('assets/images/pexels-pixabay-258154.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16.0),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Kahyangan Resort',
                    style: kNormalBoldTextStyle,
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    '3 Malam, 2 Kamar',
                    style: kNormalTextStyle,
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    '15 - 18 Des, 2020',
                    style: kNormalTextStyle,
                  ),
                  SizedBox(height: 4.0),
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
                    decoration: BoxDecoration(
                      color: ColorConst.kErrorColor.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Text(
                      'Dibatalkan',
                      style: TextStyle(
                        color: ColorConst.kErrorColor,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
