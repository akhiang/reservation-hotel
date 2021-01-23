part of 'package:dangau_hotel/screens/screens.dart';

class HotelInformation extends StatelessWidget {
  final ScrollController sc;
  final Hotel hotel;

  const HotelInformation({
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
        children: <Widget>[
          SizedBox(
            height: 12.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 32.0,
                height: 6.0,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.all(Radius.circular(12.0))),
              ),
            ],
          ),
          SizedBox(
            height: 18.0,
          ),
          _buildDescription(),
          _buildFacility(),
          _buildHotelRoom(),
          SizedBox(
            height: 24,
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
              fontSize: 18,
              letterSpacing: 1.2,
            ),
          ),
          SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FacilityCard(icon: Icons.restaurant, title: 'Restoran'),
              FacilityCard(icon: FontAwesomeIcons.swimmingPool, title: 'Kolam'),
              FacilityCard(icon: FontAwesomeIcons.wifi, title: 'Wi-Fi'),
              FacilityCard(icon: FontAwesomeIcons.thLarge, title: 'Lainnya'),
            ],
          ),
        ],
      ),
    );
  }

  Padding _buildHotelRoom() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Kamar Tersedia",
            style: TextStyle(
              color: ColorConst.kSecondaryColor,
              fontWeight: FontWeight.w600,
              fontSize: 18.0,
              letterSpacing: 1.2,
            ),
          ),
          RoomCard(hotel: hotel),
          RoomCard(hotel: hotel),
        ],
      ),
    );
  }
}
