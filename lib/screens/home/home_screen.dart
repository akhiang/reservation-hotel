part of 'package:dangau_hotel/screens/screens.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<int> list = [1, 2, 3, 4, 5];
    return Scaffold(
      body: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(24.0),
            child: CarouselSlider(
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height / 2,
                viewportFraction: 1.0,
              ),
              items: list
                  .map(
                    (item) => Container(
                      child: Center(
                        child: Text(
                          item.toString(),
                        ),
                      ),
                      color: ColorConst.kSecondaryColor,
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
