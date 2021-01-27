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
                  width: 120.0,
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
                    style: TextStyle(
                      color: ColorConst.kSecondaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 18.0,
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    '3 Malam, 2 Kamar',
                    style: TextStyle(
                      color: ColorConst.kSecondaryColor,
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    '15 - 18 Des, 2020',
                    style: TextStyle(
                      color: ColorConst.kSecondaryColor,
                      fontSize: 16.0,
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