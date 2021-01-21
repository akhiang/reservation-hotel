part of 'package:dangau_hotel/screens/screens.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<int> list = [1, 2, 3, 4, 5];
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 1.75,
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          Stack(
                            children: [
                              HomeCarousel(list: list),
                              HomeHeader(),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: HomeDatePicker(),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            HotelCarousel()
          ],
        ),
      ),
    );
  }
}
