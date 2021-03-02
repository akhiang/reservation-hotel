part of 'package:dangau_hotel/screens/screens.dart';

class MainScreen2 extends StatefulWidget {
  static const String routeName = "main_screen_2";

  @override
  _MainScreen2State createState() => _MainScreen2State();
}

class _MainScreen2State extends State<MainScreen2> {
  int currentTab = 0;

  final List<TabItem> tabs = [
    TabItem(
      tabName: "Home",
      icon: Icons.home,
      page: HomeScreen(),
    ),
    TabItem(
      tabName: "Book",
      icon: Icons.book,
      page: BookScreen(),
    ),
    TabItem(
      tabName: "User",
      icon: Icons.person,
      page: ProfileScreen(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentTab,
        children: tabs.map((e) => e.page).toList(),
      ),
      extendBody: true,
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 80.0, vertical: 16.0),
        color: Colors.transparent,
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(54.0)),
          child: BottomNavigationBar(
            currentIndex: currentTab,
            backgroundColor: ColorConst.kPrimaryColor,
            selectedItemColor: ColorConst.kSecondaryColor,
            unselectedItemColor: ColorConst.kSecondaryColor.withOpacity(0.5),
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: tabs
                .map(
                  (e) => BottomNavigationBarItem(
                    icon: Icon(e.icon),
                    // label: e.tabName,
                  ),
                )
                .toList(),
            onTap: (index) {
              setState(() {
                currentTab = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
