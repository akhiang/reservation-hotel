part of 'package:dangau_hotel/screens/screens.dart';

class OrderPaymentScreen extends StatefulWidget {
  @override
  _OrderPaymentScreenState createState() => _OrderPaymentScreenState();
}

class _OrderPaymentScreenState extends State<OrderPaymentScreen>
    with Validation {
  final _formKey = GlobalKey<FormState>();
  bool _checkboxListTile = false;
  String _methodPaymentName = 'Pilih Metode Pembayaran';
  int _methodPaymentType = 0;

  void setPaymentMethodToCard(PaymentMethod paymentMethod) {
    setState(() {
      _methodPaymentName = paymentMethod.name;
      _methodPaymentType = paymentMethod.paymentType;
    });
  }

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
            if (_methodPaymentType == 2) {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => OrderSuccessScreen(),
                  ),
                );
              }
            } else {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => OrderSuccessScreen(),
                ),
              );
            }
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildPaymentMethod(),
            _methodPaymentType == 1
                ? _buildVirtualAccountCard()
                : _methodPaymentType == 2
                    ? _buildDebitCardInputField()
                    : SizedBox(),
            _buildChoosePhoto(),
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
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            InputField(
              hint: 'Nama di kartu',
              validation: validateName,
              onChanged: (String value) {},
            ),
            InputField(
              hint: 'xxxx-xxxx-xxxx',
              validation: validateName,
              onChanged: (String value) {},
            ),
            Row(
              children: [
                Flexible(
                  flex: 1,
                  child: InputField(
                    hint: "MM/YY",
                    validation: validateDateCard,
                    onChanged: (String value) {},
                  ),
                ),
                SizedBox(width: 8.0),
                Flexible(
                  flex: 1,
                  child: InputField(
                    hint: "CVC",
                    validation: validateCvcCard,
                    onChanged: (String value) {},
                  ),
                ),
              ],
            ),
            Row(
              children: [
                CircularCheckBox(
                  value: _checkboxListTile,
                  disabledColor: Colors.grey,
                  onChanged: (value) => this.setState(() {
                    _checkboxListTile = !_checkboxListTile;
                  }),
                ),
                GestureDetector(
                  onTap: () => setState(() {
                    _checkboxListTile = !_checkboxListTile;
                  }),
                  child: Container(
                    color: ColorConst.kThirdColor,
                    padding: EdgeInsets.only(top: 8.0, right: 8.0, bottom: 8.0),
                    child: Text('Simpan untuk pembayaran berikutnya.',
                        style: kSmallBoldTextStyle),
                  ),
                ),
              ],
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
                        Text(
                            NumberFormat.currency(
                                    locale: 'id',
                                    symbol: 'Rp',
                                    decimalDigits: 0)
                                .format(4200000),
                            style: kNormalBoldTextStyle),
                      ],
                    ),
                    SizedBox(height: 8.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('PPN', style: kNormalTextStyle),
                        Text(
                            NumberFormat.currency(
                                    locale: 'id',
                                    symbol: 'Rp',
                                    decimalDigits: 0)
                                .format(420000),
                            style: kNormalBoldTextStyle),
                      ],
                    ),
                    SizedBox(height: 8.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Grand Total', style: kNormalTextStyle),
                        Text(
                            NumberFormat.currency(
                                    locale: 'id',
                                    symbol: 'Rp',
                                    decimalDigits: 0)
                                .format(4620000),
                            style: kNormalBoldTextStyle),
                      ],
                    ),
                    SizedBox(height: 8.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Bayar Sekarang', style: kNormalTextStyle),
                        Text(
                            NumberFormat.currency(
                                    locale: 'id',
                                    symbol: 'Rp',
                                    decimalDigits: 0)
                                .format(1617000),
                            style: kNormalBoldTextStyle),
                      ],
                    ),
                  ],
                ))
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
          RoundedIconCard(
            title: _methodPaymentName,
            trailingIcon: Icons.chevron_right,
            press: () async {
              final PaymentMethod paymentMethod =
                  await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SelectPaymentMethodScreen(),
                ),
              );
              if (paymentMethod == null) {
                return;
              }
              setPaymentMethodToCard(paymentMethod);
            },
          ),
        ],
      ),
    );
  }
}
