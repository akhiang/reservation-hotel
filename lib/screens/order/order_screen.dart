part of 'package:dangau_hotel/screens/screens.dart';

class OrderScreen extends StatefulWidget {
  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  PageController _controller = PageController(initialPage: 0);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(88.0),
        child: CustomAppBar(title: 'Detail Pemesanan', isLeading: true),
      ),
      extendBody: true,
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 104.0),
        height: 80.0,
        child: PrimaryButton(
          text: 'Lanjut',
          press: () {
            _controller.nextPage(
              duration: Duration(milliseconds: 800),
              curve: Curves.fastLinearToSlowEaseIn,
            );
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              // physics: NeverScrollableScrollPhysics(),
              controller: _controller,
              children: [
                OrderRoomSummary(),
                OrderCustomerContact(),
                OrderTerm(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
