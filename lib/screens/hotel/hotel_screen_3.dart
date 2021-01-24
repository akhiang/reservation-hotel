part of 'package:dangau_hotel/screens/screens.dart';

class HotelScreen3 extends StatefulWidget {
  final Hotel hotel;

  const HotelScreen3({Key key, this.hotel}) : super(key: key);

  @override
  _HotelScreen3State createState() => _HotelScreen3State();
}

class _HotelScreen3State extends State<HotelScreen3>
    with SingleTickerProviderStateMixin {
  final double _initTitleHeight = 176.0;
  double _titleHeight;
  double _panelHeightOpen;
  double _panelHeightClosed = 144.0;

  TabController _controller;
  int selectedIndex = 0;

  List<Widget> list = [
    Tab(text: 'Informasi'),
    Tab(text: 'Menu Makanan'),
    Tab(text: 'Ulasan'),
  ];

  @override
  void initState() {
    super.initState();
    _titleHeight = _initTitleHeight;
    _controller = TabController(length: list.length, vsync: this);

    _controller.addListener(() {
      setState(() {
        selectedIndex = _controller.index;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _panelHeightOpen = MediaQuery.of(context).size.height * .75;
    return Scaffold(
      body: Stack(
        children: [
          SlidingUpPanel(
            maxHeight: _panelHeightOpen,
            minHeight: _panelHeightClosed,
            parallaxEnabled: true,
            parallaxOffset: .5,
            body: _background(),
            panelBuilder: (sc) => _panel(sc),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
            ),
            onPanelSlide: (double pos) => setState(() {
              _titleHeight = pos * (_panelHeightOpen - _panelHeightClosed) +
                  _initTitleHeight;
            }),
          ),
          _buildHeader(context),
          _buildTitle(),
        ],
      ),
    );
  }

  Positioned _buildTitle() {
    return Positioned(
      left: 20.0,
      right: 20.0,
      bottom: _titleHeight,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            'Kahyangan Resort',
            style: TextStyle(
              color: ColorConst.kThirdColor,
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
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
                  '4.8',
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
    );
  }

  Positioned _buildHeader(BuildContext context) {
    return Positioned(
      top: 0.0,
      left: 0.0,
      child: IconButton(
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
    );
  }

  Widget _panel(ScrollController sc) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: Container(
        decoration: BoxDecoration(
          color: ColorConst.kThirdColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 12.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 40.0,
                  height: 4.0,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.all(Radius.circular(12.0))),
                ),
              ],
            ),
            TabBar(
              isScrollable: false,
              labelColor: ColorConst.kSecondaryColor,
              indicatorColor: ColorConst.kSecondaryColor,
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(width: 2.0),
                insets: EdgeInsets.symmetric(horizontal: 48.0, vertical: 10.0),
              ),
              tabs: list,
              controller: _controller,
              indicatorSize: TabBarIndicatorSize.tab,
            ),
            Expanded(
              child: TabBarView(
                controller: _controller,
                children: [
                  HotelInformation(sc: sc, hotel: widget.hotel),
                  HotelFood(sc: sc, hotel: widget.hotel),
                  Center(
                      child: Text(
                    "2",
                    style: TextStyle(fontSize: 40),
                  )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _background() {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/pexels-pixabay-258154.jpg'),
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
      ],
    );
  }
}
