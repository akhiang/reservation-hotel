part of 'package:dangau_hotel/screens/screens.dart';

class HelpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(88.0),
        child: CustomAppBar(title: 'Bantuan', isLeading: true),
      ),
      body: SingleChildScrollView(
        clipBehavior: Clip.none,
        child: Column(
          children: [
            RoundedCard(
              icon: null,
              title: 'Barang saya tertinggal di hotel',
              press: () {},
            ),
            RoundedCard(
              icon: null,
              title: 'Check-in lebih awal',
              press: () {},
            ),
            RoundedCard(
              icon: null,
              title: 'Saya ingin melakukan refund',
              press: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => HelpRefundScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
