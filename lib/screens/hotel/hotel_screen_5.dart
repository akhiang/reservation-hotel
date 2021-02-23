part of 'package:dangau_hotel/screens/screens.dart';

class HotelScreen5 extends StatefulWidget {
  final Hotel hotel;

  const HotelScreen5({Key key, @required this.hotel}) : super(key: key);

  @override
  _HotelScreen5State createState() => _HotelScreen5State();
}

class _HotelScreen5State extends State<HotelScreen5>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  int selectedIndex = 0;

  List<Widget> list = [
    Tab(text: 'Informasi'),
    Tab(text: 'Menu Makanan'),
    Tab(text: 'Ulasan'),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: list.length, vsync: this);

    _tabController.addListener(() {
      setState(() {
        selectedIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SnappingSheet(
        sheetAbove: SnappingSheetContent(
          child: Padding(
            padding: EdgeInsets.only(left: 24.0, right: 24.0, bottom: 32.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    widget.hotel.name,
                    style: TextStyle(
                      color: ColorConst.kThirdColor,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                    decoration: BoxDecoration(
                      color: ColorConst.kPrimaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(16.0)),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.star,
                          size: 16.0,
                          color: ColorConst.kThirdColor,
                        ),
                        SizedBox(width: 4.0),
                        Text(
                          widget.hotel.rating.toString(),
                          style: TextStyle(
                            color: ColorConst.kThirdColor,
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        snapPositions: const [
          SnapPosition(positionFactor: 0.3),
          SnapPosition(
              positionPixel: 0.0,
              snappingCurve: Curves.elasticOut,
              snappingDuration: Duration(milliseconds: 750)),
          SnapPosition(positionFactor: 0.70),
        ],
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(widget.hotel.imageUrl),
                ),
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
        grabbingHeight: MediaQuery.of(context).padding.bottom + 80,
        grabbing: GrabSection(list: list, tabController: _tabController),
        sheetBelow: SnappingSheetContent(
          child: Container(
            color: ColorConst.kThirdColor,
            child: TabBarView(
              controller: _tabController,
              children: [
                HotelInformation(hotel: widget.hotel),
                HotelFood(hotel: widget.hotel),
                HotelReview(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class GrabSection extends StatelessWidget {
  final List list;
  final TabController tabController;

  const GrabSection({
    Key key,
    this.list,
    this.tabController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorConst.kThirdColor,
        boxShadow: [
          BoxShadow(
            blurRadius: 10.0,
            color: Colors.black.withOpacity(0.2),
          )
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            width: 40.0,
            height: 5.0,
            margin: EdgeInsets.only(top: 16.0),
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.all(Radius.circular(5.0))),
          ),
          TabBar(
            labelColor: ColorConst.kSecondaryColor,
            indicatorColor: ColorConst.kSecondaryColor,
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(width: 2.0),
              insets: EdgeInsets.symmetric(horizontal: 52.0, vertical: 10.0),
            ),
            tabs: list,
            controller: tabController,
            indicatorSize: TabBarIndicatorSize.tab,
          ),
        ],
      ),
    );
  }
}
