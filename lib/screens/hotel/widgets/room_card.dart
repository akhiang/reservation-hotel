part of 'package:dangau_hotel/screens/screens.dart';

class RoomCard extends StatelessWidget {
  const RoomCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 152.0,
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: ColorConst.kThirdColor,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: ColorConst.kSecondaryColor.withOpacity(0.15),
            offset: Offset(0.0, 5.0),
            blurRadius: 20.0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Hero(
            tag: 'assets/images/pexels-pixabay-258154.jpg',
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(16.0)),
              child: SizedBox(
                width: 88.0,
                child: AspectRatio(
                  aspectRatio: 0.5,
                  child: Image(
                    image:
                        AssetImage('assets/images/pexels-pixabay-258154.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 8.0),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        "Deluxe Twin",
                        style: TextStyle(
                          color: ColorConst.kSecondaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 16.0,
                        ),
                      ),
                      Text(
                        "with Baclcony",
                        style: TextStyle(
                          color: ColorConst.kSecondaryColor,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      print('cek');
                    },
                    child: Text(
                      "Cek Detail",
                      style: TextStyle(
                        color: ColorConst.kErrorColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Rp700.000 / malam",
                    style: TextStyle(
                      color: ColorConst.kErrorColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  PrimaryButton(
                    text: 'Pilih',
                  )
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.people,
                    color: ColorConst.kSecondaryColor,
                  ),
                  SizedBox(width: 8.0),
                  Text(
                    "2",
                    style: TextStyle(
                      color: ColorConst.kSecondaryColor,
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
