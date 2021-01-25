part of 'package:dangau_hotel/screens/screens.dart';

class HotelScreen4 extends StatefulWidget {
  final Hotel hotel;

  const HotelScreen4({
    Key key,
    this.hotel,
  }) : super(key: key);

  @override
  _HotelScreen4State createState() => _HotelScreen4State();
}

class _HotelScreen4State extends State<HotelScreen4>
    with SingleTickerProviderStateMixin {
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
    _controller = TabController(length: list.length, vsync: this);

    _controller.addListener(() {
      setState(() {
        selectedIndex = _controller.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidingSheet(
        elevation: 8,
        cornerRadius: 16,
        cornerRadiusOnFullscreen: 0.0,
        color: ColorConst.kThirdColor,
        snapSpec: const SnapSpec(
          snap: true,
          snappings: [0.2, 0.7],
          positioning: SnapPositioning.relativeToAvailableSpace,
        ),
        body: Center(
          child: Text('This widget is below the SlidingSheet'),
        ),
        headerBuilder: (context, state) {
          return TabBar(
            labelColor: ColorConst.kSecondaryColor,
            indicatorColor: ColorConst.kSecondaryColor,
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(width: 2.0),
              insets: EdgeInsets.symmetric(horizontal: 48.0, vertical: 10.0),
            ),
            tabs: list,
            controller: _controller,
            indicatorSize: TabBarIndicatorSize.tab,
          );
        },
        builder: (context, state) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              IndexedStack(
                children: <Widget>[
                  Visibility(
                    child: HotelInformation(hotel: widget.hotel),
                    maintainState: true,
                    visible: selectedIndex == 0,
                  ),
                  Visibility(
                    child: HotelFood(hotel: widget.hotel),
                    maintainState: true,
                    visible: selectedIndex == 1,
                  ),
                  Visibility(
                    child: HotelReview(),
                    maintainState: true,
                    visible: selectedIndex == 2,
                  ),
                ],
                index: selectedIndex,
              ),
            ],
          );
        },
      ),
    );
  }
}
