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
                  // height: MediaQuery.of(context).size.height / 1.65,
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          Stack(
                            children: [
                              HomeCarousel(
                                list: list,
                                indicatorHeight: 16.0,
                              ),
                              HomeHeader(),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Positioned.fill(
                //   child: Align(
                //     alignment: Alignment.bottomCenter,
                //     child: HomeDatePicker(),
                //   ),
                // ),
              ],
            ),
            SizedBox(height: 24.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Lorem Ipsum \nDolor Sit Amet',
                    style: kLargeBoldTextStyle,
                  ),
                  SizedBox(height: 16.0),
                  Text(
                      'Silahkan verfikasi diri anda terlebih dahulu untuk melakukan pemesanan!',
                      style: kNormalTextStyle),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            HotelCarousel()
          ],
        ),
      ),
    );
  }
}
