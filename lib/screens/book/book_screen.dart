part of 'package:dangau_hotel/screens/screens.dart';

class BookScreen extends StatefulWidget {
  @override
  _BookScreenState createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen>
    with SingleTickerProviderStateMixin {
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'Yang akan datang'),
    Tab(text: 'Riwayat'),
  ];
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(88.0),
        child: CustomAppBar(title: 'Pesanan Saya', isLeading: false),
      ),
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
            child: Container(
              decoration: BoxDecoration(
                color: ColorConst.kSecondaryColor.withOpacity(0.05),
                borderRadius: BorderRadius.circular(32.0),
              ),
              child: TabBar(
                controller: _tabController,
                tabs: myTabs,
                unselectedLabelColor:
                    ColorConst.kSecondaryColor.withOpacity(0.2),
                labelStyle: TextStyle(
                    color: ColorConst.kSecondaryColor,
                    fontWeight: FontWeight.w600),
                indicatorPadding: EdgeInsets.only(left: 32, right: 32.0),
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(40.0),
                  color: ColorConst.kPrimaryColor,
                ),
              ),
            ),
          ),
          Expanded(
            child: TabBarView(controller: _tabController, children: [
              BookIncomingScreen(),
              BookHistoryScreen(),
            ]),
          ),
        ],
      ),
    );
  }
}
