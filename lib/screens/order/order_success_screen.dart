part of 'package:dangau_hotel/screens/screens.dart';

class OrderSuccessScreen extends StatelessWidget {
  static const String routeName = "order_success_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(88.0),
        child: CustomAppBar(title: 'Sukses', isLeading: false),
      ),
      extendBody: true,
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 104.0),
        height: 80.0,
        child: PrimaryButton(
          text: 'Kembali ke Beranda',
          press: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          OrderedRoomCard(),
          SizedBox(height: 88.0),
        ],
      )),
    );
  }
}
