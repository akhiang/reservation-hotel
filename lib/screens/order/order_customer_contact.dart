part of 'package:dangau_hotel/screens/screens.dart';

class OrderCustomerContact extends StatefulWidget {
  @override
  _OrderCustomerContactState createState() => _OrderCustomerContactState();
}

class _OrderCustomerContactState extends State<OrderCustomerContact>
    with SingleTickerProviderStateMixin {
  bool orderForOtherCheckbox = false;

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
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => OrderTerm()),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildCustomerInfo(),
            _buildAddOtherCustomer(),
            _buildRequestNote(),
            FlatButton(
              onPressed: () {},
              child: Text(
                'Batalkan Pesanan',
                style: TextStyle(
                  color: ColorConst.kErrorColor,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24.0),
              ),
            ),
            SizedBox(height: 88.0),
          ],
        ),
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
          RoundedExpandCard(title: 'John Doe')
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
          Row(
            children: [
              CircularCheckBox(
                value: orderForOtherCheckbox,
                disabledColor: Colors.grey,
                onChanged: (value) => this.setState(() {
                  orderForOtherCheckbox = !orderForOtherCheckbox;
                }),
              ),
              GestureDetector(
                onTap: () => setState(() {
                  orderForOtherCheckbox = !orderForOtherCheckbox;
                }),
                child: Container(
                  color: ColorConst.kThirdColor,
                  padding: EdgeInsets.only(top: 8.0, right: 8.0, bottom: 8.0),
                  child: Text('Saya Memesan Untuk Orang Lain',
                      style: kNormalTextStyle),
                ),
              ),
            ],
          ),
          SizedBox(height: 8.0),
          ExpandedSection(
            expand: orderForOtherCheckbox,
            child: Column(
              children: [
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
              ],
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
