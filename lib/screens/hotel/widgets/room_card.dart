part of 'package:dangau_hotel/screens/screens.dart';

class RoomCard extends StatelessWidget {
  final Room room;
  final Function press;

  const RoomCard({
    Key key,
    @required this.room,
    @required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => RoomScreen(room: room),
          ),
        );
      },
      child: Container(
        height: 128.0,
        width: double.infinity,
        margin: EdgeInsets.symmetric(vertical: 8.0),
        padding: EdgeInsets.all(12.0),
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
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(16.0)),
              child: SizedBox(
                width: 88.0,
                child: AspectRatio(
                  aspectRatio: 0.5,
                  child: Image.network(
                    "${room.imageUrl}",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(width: 8.0),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "${room.name}",
                              style: TextStyle(
                                color: ColorConst.kSecondaryColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 16.0,
                              ),
                            ),
                            TextSpan(
                              text: ' ${room.variant}',
                              style: TextStyle(
                                color: ColorConst.kSecondaryColor,
                                fontSize: 12.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 4.0),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Rp${room.price}',
                              style: TextStyle(
                                color: ColorConst.kErrorColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 13.0,
                              ),
                            ),
                            TextSpan(
                              text: "/malam",
                              style: TextStyle(
                                color: ColorConst.kSecondaryColor,
                                fontSize: 12.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.people,
                            color: ColorConst.kSecondaryColor,
                          ),
                          SizedBox(width: 4.0),
                          Text(
                            "${room.guest}",
                            style: TextStyle(
                              color: ColorConst.kSecondaryColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 32.0,
                        child: PrimaryButton(
                          text: 'Pilih',
                          press: press,
                        ),
                      )
                    ],
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
