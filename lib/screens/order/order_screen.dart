part of 'package:dangau_hotel/screens/screens.dart';

class OrderScreen extends StatefulWidget {
  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(88.0),
        child: CustomAppBar(title: 'Detail Pemesanan', isLeading: true),
      ),
      extendBody: true,
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 88.0),
        height: 80.0,
        child: PrimaryButton(
          text: 'Lanjut',
          press: () {},
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildRoomChoice(),
                  _buildAddMoreRoom(),
                  _buildPriceDetail(),
                  SizedBox(height: 88.0),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddMoreRoom() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.0),
      width: double.infinity,
      height: 56.0,
      child: ShadowButton(
        icon: Icons.add,
        text: 'Tambah Kamar',
        press: () {},
      ),
    );
  }

  Widget _buildRoomChoice() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Pilihan Kamar', style: kNormalTextStyle),
          RoundedCard(
            title: 'Deluxe Twin,',
            subtitle: ' with Balcony',
          ),
        ],
      ),
    );
  }

  Widget _buildPriceDetail() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Detail Harga', style: kNormalTextStyle),
          OrderPriceDetail(),
        ],
      ),
    );
  }
}
