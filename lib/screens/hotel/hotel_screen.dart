part of 'package:dangau_hotel/screens/screens.dart';

class HotelScreen extends StatefulWidget {
  final Hotel hotel;

  const HotelScreen({Key key, this.hotel}) : super(key: key);

  @override
  _HotelScreenState createState() => _HotelScreenState();
}

class _HotelScreenState extends State<HotelScreen> {
  final double expandedHeight = 400;
  final double roundedContainerHeight = 60;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              _buildSliverHeader(),
              SliverToBoxAdapter(
                child: _buildDetail(widget.hotel),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top,
            ),
            child: SizedBox(
              height: kToolbarHeight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 32.0,
                    ),
                    icon: Icon(
                      Icons.chevron_left,
                      size: 32.0,
                      color: ColorConst.kThirdColor,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  SliverPersistentHeader _buildSliverHeader() {
    return SliverPersistentHeader(
      delegate: DetailSliverDelegate(
        expandedHeight: expandedHeight,
        hotel: widget.hotel,
        roundedContainerHeight: roundedContainerHeight,
      ),
    );
  }
}

Widget _buildDetail(Hotel hotel) {
  return ClipRRect(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(32.0),
      topRight: Radius.circular(32.0),
    ),
    child: Container(
      color: ColorConst.kThirdColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
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
          ),
          _buildfacilityCard(),
          _buildAvailableRoom(hotel),
        ],
      ),
    ),
  );
}

Padding _buildfacilityCard() {
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

Padding _buildAvailableRoom(Hotel hotel) {
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

class DetailSliverDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final Hotel hotel;
  final double roundedContainerHeight;

  DetailSliverDelegate(
      {this.expandedHeight, this.hotel, this.roundedContainerHeight});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
      child: Stack(
        children: <Widget>[
          Hero(
            tag: hotel.name,
            child: Image.asset(
              hotel.imageUrl,
              width: SizeConfig.screenWidth(context),
              height: expandedHeight,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  ColorConst.kSecondaryColor.withOpacity(0.0),
                  ColorConst.kSecondaryColor.withOpacity(1.0)
                ],
              ),
            ),
          ),
          Positioned(
            top: expandedHeight - 120 - shrinkOffset,
            left: 32.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  hotel.name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    letterSpacing: 1.2,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => 0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
