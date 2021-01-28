part of 'package:dangau_hotel/screens/screens.dart';

class RoomScreen extends StatelessWidget {
  final List<int> list = [1, 2, 3, 4, 5];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                HomeCarousel(
                  list: list,
                  height: 0.4,
                  autoPlay: false,
                ),
                IconButton(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 64.0,
                  ),
                  icon: Icon(
                    Icons.chevron_left,
                    size: 32.0,
                    color: ColorConst.kThirdColor,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
            _buildRoomDetail(),
            _buildFacility(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Divider(
                color: ColorConst.kSecondaryColor.withOpacity(0.5),
              ),
            ),
            _buildDescription(),
          ],
        ),
      ),
    );
  }

  Padding _buildRoomDetail() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                textAlign: TextAlign.left,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Deluxe Twin",
                      style: TextStyle(
                        color: ColorConst.kSecondaryColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 20.0,
                      ),
                    ),
                    TextSpan(
                      text: "\nwith Balcony",
                      style: TextStyle(
                        color: ColorConst.kSecondaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              RichText(
                textAlign: TextAlign.right,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Rp700.000",
                      style: TextStyle(
                        color: ColorConst.kErrorColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 20.0,
                      ),
                    ),
                    TextSpan(
                      text: "\n/malam",
                      style: TextStyle(
                        color: ColorConst.kSecondaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    FontAwesomeIcons.doorOpen,
                    color: ColorConst.kErrorColor,
                  ),
                  SizedBox(width: 8.0),
                  Text(
                    "20",
                    style: TextStyle(
                      color: ColorConst.kSecondaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Text(
                "Belum termasuk PPN 10%",
                style: TextStyle(
                  color: ColorConst.kSecondaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Padding _buildFacility() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Fasilitas",
            style: TextStyle(
              color: ColorConst.kSecondaryColor,
              fontWeight: FontWeight.w600,
              fontSize: 18.0,
              letterSpacing: 1.2,
            ),
          ),
          SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FacilityCard(icon: FontAwesomeIcons.bed, title: '1 King Bed'),
              FacilityCard(icon: Icons.people, title: '2 Tamu', size: 32.0),
              FacilityCard(icon: Icons.restaurant, title: 'Sarapan'),
              FacilityCard(icon: FontAwesomeIcons.thLarge, title: 'Lainnya'),
            ],
          ),
        ],
      ),
    );
  }

  Padding _buildDescription() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
      child: Text(
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quis lectus nec mollis senectus dui vestibulum, lectus vel id. Mattis fermentum sagittis, et, dui a cursus ut leo. Viverra quis in netus at cras tortor. Et habitant ac tincidunt aenean. Velit in ac nisi, turpis. ",
        style: TextStyle(
          color: ColorConst.kSecondaryColor,
          height: 1.4,
          fontSize: 16.0,
        ),
        textAlign: TextAlign.justify,
      ),
    );
  }
}
