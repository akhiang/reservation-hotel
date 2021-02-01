part of 'package:dangau_hotel/screens/screens.dart';

class OrderPaymentScreen extends StatefulWidget {
  @override
  _OrderPaymentScreenState createState() => _OrderPaymentScreenState();
}

class _OrderPaymentScreenState extends State<OrderPaymentScreen> {
  int _currVal = 1;
  String _currText = 'BCA Virtual Account';
  bool _checkboxListTile = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(88.0),
        child: CustomAppBar(title: 'Pembayaran', isLeading: true),
      ),
      extendBody: true,
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 104.0),
        height: 80.0,
        child: PrimaryButton(
          text: 'Bayar',
          press: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => OrderSuccessScreen(),
              ),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildPaymentMethod(),
            _buildVirtualAccountCard(),
            _buildChoosePhoto(),
            _buildDebitCardInputField(),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
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

  Widget _buildDebitCardInputField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          RoundedInputField(
            hint: "Nama di kartu",
            onChanged: (value) {},
          ),
          RoundedInputField(
            hint: "xxxx-xxxx-xxxx",
            onChanged: (value) {},
          ),
          Row(
            children: [
              Flexible(
                flex: 1,
                child: RoundedInputField(
                  hint: "MM/YY",
                  onChanged: (value) {},
                ),
              ),
              SizedBox(width: 8.0),
              Flexible(
                flex: 1,
                child: RoundedInputField(
                  hint: "CVC",
                  onChanged: (value) {},
                ),
              ),
            ],
          ),
          CheckboxListTile(
            dense: true,
            controlAffinity: ListTileControlAffinity.leading,
            title: Text('Simpan untuk pembayaran berikutnya.',
                style: kSmallBoldTextStyle),
            value: _checkboxListTile,
            onChanged: (value) {
              setState(() {
                _checkboxListTile = !_checkboxListTile;
              });
            },
          ),
          SizedBox(height: 8.0),
          Container(
              padding: EdgeInsets.all(16.0),
              width: double.infinity,
              decoration: BoxDecoration(
                color: ColorConst.kThirdColor,
                boxShadow: [kShadow],
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total', style: kNormalTextStyle),
                      Text('4200000', style: kNormalBoldTextStyle),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('PPN', style: kNormalTextStyle),
                      Text('420000', style: kNormalBoldTextStyle),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Grand Total', style: kNormalTextStyle),
                      Text('4620000', style: kNormalBoldTextStyle),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Bayar Sekarang', style: kNormalTextStyle),
                      Text('1617000', style: kNormalBoldTextStyle),
                    ],
                  ),
                ],
              ))
        ],
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
