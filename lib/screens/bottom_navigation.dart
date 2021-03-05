part of 'package:dangau_hotel/screens/screens.dart';

class BottomNavigation extends StatelessWidget {
  BottomNavigation({
    this.onSelectTab,
    this.tabs,
  });
  final ValueChanged<int> onSelectTab;
  final List<TabItem> tabs;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 80.0, vertical: 16.0),
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(54.0),
        ),
        child: BottomNavigationBar(
          backgroundColor: ColorConst.kPrimaryColor,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          items: tabs
              .map(
                (e) => _buildItem(
                  index: e.getIndex(),
                  icon: e.icon,
                  tabName: e.tabName,
                ),
              )
              .toList(),
          onTap: (index) => onSelectTab(
            index,
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildItem({
    int index,
    IconData icon,
    String tabName,
  }) {
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        color: _tabColor(index: index),
        size: 24.0,
      ),
      // ignore: deprecated_member_use
      title: Text(
        tabName,
        style: TextStyle(
          color: _tabColor(index: index),
          fontSize: 12,
        ),
      ),
    );
  }

  Color _tabColor({int index}) {
    return MainScreenState.currentTab == index
        ? ColorConst.kSecondaryColor
        : ColorConst.kSecondaryColor.withOpacity(0.5);
  }
}
