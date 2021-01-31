part of 'package:dangau_hotel/screens/screens.dart';

class OrderPaymentScreen extends StatefulWidget {
  @override
  _OrderPaymentScreenState createState() => _OrderPaymentScreenState();
}

class _OrderPaymentScreenState extends State<OrderPaymentScreen> {
  int _currVal = 1;
  String _currText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(88.0),
        child: CustomAppBar(title: 'Pembayaran', isLeading: true),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildPaymentMethod(),
            _buildVirtualAccountCard(),
            _buildChoosePhoto(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                  'Upload foto bukti pembayaran anda untuk verifikasi manual jika terjadi kesalahan',
                  textAlign: TextAlign.center,
                  style: kNormalBoldTextStyle),
            ),
            SizedBox(height: 88.0),
          ],
        ),
      ),
    );
  }

  Widget _buildChoosePhoto() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      child: Container(
        height: 152.0,
        width: double.infinity,
        decoration: BoxDecoration(
          color: ColorConst.kSecondaryColor.withOpacity(0.05),
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.image,
              size: 40.0,
              color: ColorConst.kSecondaryColor.withOpacity(0.2),
            ),
            SizedBox(height: 16.0),
            Text('Pilih Foto', style: kNormalTextStyle),
          ],
        ),
      ),
    );
  }

  Widget _buildVirtualAccountCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      child: VirtualAccountCard(),
    );
  }

  Widget _buildPaymentMethod() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Metode Pembayaran', style: kNormalTextStyle),
          SizedBox(height: 8.0),
          RoundedExpandRadioCard(
            title: _currText,
            radioList: Column(
              children: methods
                  .map((method) => ClipRRect(
                        borderRadius: BorderRadius.circular(32.0),
                        child: RadioButtonTile(
                          title: method.name,
                          group: _currVal,
                          value: method.id,
                          press: () {
                            setState(() {
                              _currVal = method.id;
                              _currText = method.name;
                            });
                            print(_currVal);
                          },
                          onChange: (value) {
                            setState(() {
                              _currVal = value;
                              _currText = method.name;
                            });
                            print(value);
                          },
                        ),
                      ))
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}
