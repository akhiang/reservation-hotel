part of 'package:dangau_hotel/screens/screens.dart';

class OrderCustomerContact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildCustomerInfo(),
          _buildAddOtherCustomer(),
          _buildRequestNote(),
          SizedBox(height: 88.0),
        ],
      ),
    );
  }

  Widget _buildCustomerInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Informasi Pemesan', style: kNormalTextStyle),
          SizedBox(height: 16.0),
          RoundedExpandCard()
        ],
      ),
    );
  }

  Widget _buildAddOtherCustomer() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Saya Memesan Untuk Orang Lain', style: kNormalTextStyle),
          SizedBox(height: 8.0),
          RoundedInputField(
            hint: "Nama",
            onChanged: (value) {},
          ),
          RoundedInputField(
            hint: "No. Telp",
            onChanged: (value) {},
          ),
          RoundedInputField(
            hint: "Email",
            onChanged: (value) {},
          ),
          RoundedInputField(
            hint: "Alamat",
            onChanged: (value) {},
          ),
          Container(
            margin: EdgeInsets.only(top: 8.0),
            width: double.infinity,
            height: 56.0,
            child: ShadowButton(
              icon: Icons.add,
              text: 'Tambah Info Pemesan',
              press: () {},
            ),
          )
        ],
      ),
    );
  }

  Widget _buildRequestNote() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Permintaan & Catatan Khusus', style: kNormalTextStyle),
          SizedBox(height: 8.0),
          RoundedTextArea(
            line: 4,
            hint: "*Anda boleh mengosongkan bagian ini",
            onChanged: (value) {},
          )
        ],
      ),
    );
  }
}
