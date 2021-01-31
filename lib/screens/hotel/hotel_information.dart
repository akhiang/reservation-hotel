part of 'package:dangau_hotel/screens/screens.dart';

class HotelInformation extends StatefulWidget {
  final ScrollController sc;
  final Hotel hotel;

  const HotelInformation({
    Key key,
    this.sc,
    this.hotel,
  }) : super(key: key);

  @override
  _HotelInformationState createState() => _HotelInformationState();
}

class _HotelInformationState extends State<HotelInformation> {
  void _showSummaryBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Wrap(
        children: [
          Container(
            // height: MediaQuery.of(context).size.height * 0.5,
            padding: EdgeInsets.all(32.0),
            decoration: new BoxDecoration(
              color: ColorConst.kThirdColor,
              borderRadius: new BorderRadius.only(
                topLeft: const Radius.circular(25.0),
                topRight: const Radius.circular(25.0),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ringkasan Harga',
                  style: TextStyle(
                    color: ColorConst.kSecondaryColor,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  '3 Malam, 2 Kamar',
                  style: TextStyle(
                    color: ColorConst.kSecondaryColor,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 8.0),
                SummaryRoomListTile(),
                SummaryRoomListTile(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Divider(
                      color: ColorConst.kSecondaryColor.withOpacity(0.5)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Harga',
                      style: TextStyle(
                        color: ColorConst.kSecondaryColor,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'Rp4200000',
                      style: TextStyle(
                        color: ColorConst.kSecondaryColor,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 64.0),
            child: Column(
              children: <Widget>[
                _buildDescription(),
                _buildContact(),
                _buildFacility(),
                _buildHotelRoom(context),
              ],
            ),
          ),
        ),
        _buildBottomOrderButton(context)
      ],
    );
  }

  Positioned _buildBottomOrderButton(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: ColorConst.kThirdColor,
          boxShadow: [
            BoxShadow(
              color: ColorConst.kSecondaryColor.withOpacity(0.2),
              offset: Offset(0.0, 5.0),
              blurRadius: 20.0,
            ),
          ],
        ),
        height: 64.0,
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                _showSummaryBottomSheet();
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                width: SizeConfig.screenWidth(context) * 0.4,
                decoration: BoxDecoration(
                  color: ColorConst.kThirdColor,
                  borderRadius: BorderRadius.circular(32.0),
                  boxShadow: [
                    BoxShadow(
                      color: ColorConst.kSecondaryColor.withOpacity(0.15),
                      offset: Offset(0.0, 5.0),
                      blurRadius: 20.0,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Total',
                          style: TextStyle(
                            color: ColorConst.kSecondaryColor,
                            fontSize: 12.0,
                          ),
                        ),
                        Text(
                          'Rp1400000',
                          style: TextStyle(
                            color: ColorConst.kSecondaryColor,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                    Icon(FontAwesomeIcons.chevronUp, size: 16.0),
                  ],
                ),
              ),
            ),
            SizedBox(width: 8.0),
            Expanded(
              child: SizedBox(
                height: 56.0,
                child: PrimaryButton(
                  text: 'Pesan Sekarang',
                  press: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => OrderPaymentScreen(),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
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

  Padding _buildHotelRoom(BuildContext context) {
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
          RoomCard(
            hotel: widget.hotel,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RoomPreferenceScreen(),
                ),
              );
            },
          ),
          // RoomCard(hotel: hotel),
        ],
      ),
    );
  }
}
