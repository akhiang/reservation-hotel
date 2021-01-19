part of 'package:dangau_hotel/screens/screens.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  static int currentTab = 0;

  final List<TabItem> tabs = [
    TabItem(
      tabName: "Home",
      icon: Icons.home,
      page: HomeScreen(),
    ),
    TabItem(
      tabName: "Book",
      icon: FontAwesomeIcons.book,
      page: BookScreen(),
    ),
    TabItem(
      tabName: "Settings",
      icon: Icons.person,
      page: UserScreen(),
    ),
  ];

  MainScreenState() {
    tabs.asMap().forEach((index, details) {
      details.setIndex(index);
    });
  }

  void _selectTab(int index) {
    if (index == currentTab) {
      tabs[index].key.currentState.popUntil((route) => route.isFirst);
    } else {
      setState(() => currentTab = index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            !await tabs[currentTab].key.currentState.maybePop();
        if (isFirstRouteInCurrentTab) {
          if (currentTab != 0) {
            _selectTab(0);
            return false;
          }
        }
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        // backgroundColor: Colors.transparent,
        body: IndexedStack(
          index: currentTab,
          children: tabs.map((e) => e.page).toList(),
        ),
        extendBody: true,
        bottomNavigationBar: BottomNavigation(
          onSelectTab: _selectTab,
          tabs: tabs,
        ),
        // bottomNavigationBar: FloatingNavbar(
        //   borderRadius: 32.0,
        //   width: 300.0,
        //   selectedBackgroundColor: Colors.transparent,
        //   selectedItemColor: ColorConst.kSecondaryColor,
        //   unselectedItemColor: ColorConst.kSecondaryColor.withOpacity(0.5),
        //   backgroundColor: ColorConst.kPrimaryColor,
        //   onTap: (int val) => setState(() => currentTab = val),
        //   currentIndex: currentTab,
        //   items: [
        //     FloatingNavbarItem(icon: Icons.home, title: 'Home'),
        //     FloatingNavbarItem(icon: FontAwesomeIcons.book, title: 'Book'),
        //     FloatingNavbarItem(icon: Icons.person, title: 'User'),
        //   ],
        // ),
      ),
    );
  }
}
