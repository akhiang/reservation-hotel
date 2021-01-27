part of 'package:dangau_hotel/screens/screens.dart';

class HomeCarousel extends StatefulWidget {
  final List<int> list;
  final double height;
  final bool autoPlay;
  final double indicatorHeight;

  const HomeCarousel({
    Key key,
    @required this.list,
    this.height = 0.5,
    this.autoPlay = true,
    this.indicatorHeight = 10.0,
  }) : super(key: key);

  @override
  _HomeCarouselState createState() => _HomeCarouselState();
}

class _HomeCarouselState extends State<HomeCarousel> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(24.0),
            bottomRight: Radius.circular(24.0),
          ),
          child: CarouselSlider(
            options: CarouselOptions(
                height: MediaQuery.of(context).size.height * widget.height,
                viewportFraction: 1.0,
                autoPlay: widget.autoPlay,
                autoPlayInterval: Duration(seconds: 10),
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
            items: widget.list
                .map(
                  (item) => Container(
                    child: Image.asset(
                      'assets/images/pexels-thorsten-technoman-338504.jpg',
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                    color: ColorConst.kSecondaryColor,
                  ),
                )
                .toList(),
          ),
        ),
        Positioned.fill(
          bottom: widget.indicatorHeight,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: widget.list.map((url) {
                int index = widget.list.indexOf(url);
                return Container(
                  width: _current == index ? 16.0 : 8.0,
                  height: 4.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(4.0),
                    color: _current == index
                        ? ColorConst.kThirdColor
                        : ColorConst.kThirdColor.withOpacity(0.3),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
