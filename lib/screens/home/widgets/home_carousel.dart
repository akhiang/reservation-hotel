part of 'package:dangau_hotel/screens/screens.dart';

class HomeCarousel extends StatelessWidget {
  const HomeCarousel({
    Key key,
    @required this.list,
  }) : super(key: key);

  final List<int> list;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(24.0),
        bottomRight: Radius.circular(24.0),
      ),
      child: CarouselSlider(
        options: CarouselOptions(
          height: MediaQuery.of(context).size.height / 2,
          viewportFraction: 1.0,
        ),
        items: list
            .map(
              (item) => Container(
                child: Image.asset(
                  'assets/images/pexels-thorsten-technoman-338504.jpg',
                  fit: BoxFit.cover,
                ),
                color: ColorConst.kSecondaryColor,
              ),
            )
            .toList(),
      ),
    );
  }
}
