part of 'package:dangau_hotel/screens/screens.dart';

class OrderRoomSummary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildRoomChoice(),
          _buildAddMoreRoom(),
          _buildPriceDetail(),
          SizedBox(height: 88.0),
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
          RoundedExpandCard(),
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
          SizedBox(height: 16.0),
          OrderPriceDetail(),
        ],
      ),
    );
  }
}
