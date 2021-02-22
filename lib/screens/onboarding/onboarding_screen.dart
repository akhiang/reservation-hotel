part of 'package:dangau_hotel/screens/screens.dart';

class OnBoardingScreen extends StatefulWidget {
  static const routeName = 'on_boarding_screen';

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int _currentPage = 0;
  PageController _controller = PageController(
    initialPage: 0,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<Map<String, String>> splashData = [
    {
      "text":
          "Praesent tellus mauris, tincidunt nec ipsum id, faucibus pellentesque leo. Nunc congue ac tellus quis porttitor. ",
    },
    {
      "text":
          "Praesent tellus mauris, tincidunt nec ipsum id, faucibus pellentesque leo. Nunc congue ac tellus quis porttitor. ",
    },
    {
      "text":
          "tincidunt nec ipsum id, faucibus pellentesque leo. Nunc congue ac tellus quis porttitor. ",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeroImage(
            height: 0.40,
            imageUrl: 'assets/images/pexels-thorsten-technoman-338504.jpg',
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 40.0),
            child: Text('Selamat Datang di, \nDangau Group \nHotel App',
                style: kLargeBoldTextStyle),
          ),
          Expanded(
            flex: 1,
            child: PageView.builder(
              controller: _controller,
              onPageChanged: (value) {
                setState(() {
                  _currentPage = value;
                });
              },
              itemCount: splashData.length,
              itemBuilder: (context, index) => OnBoardingContent(
                text: splashData[index]['text'],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40.0),
            margin: EdgeInsets.only(bottom: 24.0),
            child: _currentPage == splashData.length - 1
                ? SizedBox(
                    width: double.infinity,
                    height: 48.0,
                    child: PrimaryButton(
                      text: 'Mulai',
                      press: () {
                        AppDataPreferences.setFirstLaunch();
                        Navigator.pushNamedAndRemoveUntil(
                            context, MainScreen.routeName, (route) => false);
                      },
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          splashData.length,
                          (index) => buildDot(index: index),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          _controller.animateToPage(2,
                              duration: Duration(milliseconds: 250),
                              curve: Curves.easeInOut);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Lewati', style: kNormalTextStyle),
                        ),
                      ),
                    ],
                  ),
          )
        ],
      ),
    );
  }

  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: _currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: _currentPage == index
            ? ColorConst.kPrimaryColor
            : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
