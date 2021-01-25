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
      // controller: sc,
      physics: BouncingScrollPhysics(),
      child: Column(
        children: <Widget>[
          _buildDescription(),
          _buildContact(),
          _buildFacility(),
          _buildHotelRoom(),
          SizedBox(height: 24.0),
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

  Padding _buildContact() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
      child: Column(
        children: [
          HotelContactListTile(
            icon: FontAwesomeIcons.mapMarkerAlt,
            text:
                "Jl. Raya Tj. Gundul, Karimunting, Sungai Raya Kepulauan, Kabupaten Bengkayang, Kal-Bar 79271",
          ),
          HotelContactListTile(
            icon: Icons.phone,
            text: "+62 7187655856",
          ),
          HotelContactListTile(
            icon: Icons.email,
            text: "resortkahyangan@gmail.com",
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
