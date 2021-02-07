part of 'package:dangau_hotel/screens/screens.dart';

class MainScreen extends StatefulWidget {
  static const String routeName = 'main_screen';

  @override
  State<StatefulWidget> createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  static int currentTab = 0;

  final List<TabItem> tabs = [
    TabItem(
      tabName: "Home",
      icon: Icons.home_rounded,
      page: HomeScreen(),
    ),
    TabItem(
      tabName: "Book",
      icon: FontAwesomeIcons.book,
      page: BookScreen(),
    ),
    TabItem(
      tabName: "User",
      icon: Icons.person,
      page: ProfileScreen(),
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
        body: IndexedStack(
          index: currentTab,
          children: tabs.map((e) => e.page).toList(),
        ),
        extendBody: true,
        bottomNavigationBar: BottomNavigation(
          onSelectTab: _selectTab,
          tabs: tabs,
        ),
      ),
    );
  }
}
