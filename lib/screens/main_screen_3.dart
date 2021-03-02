part of 'package:dangau_hotel/screens/screens.dart';

class MainScreen3 extends StatefulWidget {
  static const String routeName = "main_screen_3";

  @override
  _MainScreen3State createState() => _MainScreen3State();
}

class _MainScreen3State extends State<MainScreen3> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomeScreen(),
    BookScreen(),
    ProfileScreen(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _children,
      ),
      extendBody: true,
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.screenWidth(context) * 0.22,
          vertical: 16.0,
        ),
        color: Colors.transparent,
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(54.0)),
          child: BottomNavigationBar(
            backgroundColor: ColorConst.kPrimaryColor,
            selectedItemColor: ColorConst.kSecondaryColor,
            unselectedItemColor: ColorConst.kSecondaryColor.withOpacity(0.5),
            showSelectedLabels: false,
            showUnselectedLabels: false,
            onTap: onTabTapped,
            currentIndex: _currentIndex,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.book_rounded),
                label: 'My Order',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
