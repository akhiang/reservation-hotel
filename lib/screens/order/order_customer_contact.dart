part of 'package:dangau_hotel/screens/screens.dart';

class OrderCustomerContact extends StatefulWidget {
  @override
  _OrderCustomerContactState createState() => _OrderCustomerContactState();
}

class _OrderCustomerContactState extends State<OrderCustomerContact>
    with SingleTickerProviderStateMixin, Validation {
  final formKey = GlobalKey<FormState>();
  bool orderForOtherCheckbox = false;

  String name = '';

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
            if (orderForOtherCheckbox) {
              if (formKey.currentState.validate()) {
                formKey.currentState.save();
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => OrderTerm()),
                );
              }
            } else {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => OrderTerm()),
              );
            }
          },
        ),
      ),
      body: Column(
        children: [
          _buildTimeline(context),
          SizedBox(height: 8.0),
          _buildOrderCheckoutTimer(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildCustomerInfo(),
                  _buildAddOtherCustomerForm(),
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
          ),
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
          RoundedExpandCard(title: 'John Doe')
        ],
      ),
    );
  }

  Widget _buildAddOtherCustomerForm() {
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
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  RoundedInputField(
                    hint: "Nama",
                    validation: validateName,
                    onChanged: (String value) {},
                  ),
                  TextFormField(
                    validator: validateName,
                    decoration: new InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 24.0, vertical: 20.0),
                      border: new OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(const Radius.circular(32.0)),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      hintStyle: new TextStyle(color: Colors.grey[800]),
                      hintText: "Type in your text",
                      fillColor: ColorConst.kSecondaryColor.withOpacity(0.05),
                    ),
                  )
                  // RoundedInputField(
                  //   hint: "No. Telp",
                  //   onChanged: (value) {},
                  // ),
                  // RoundedInputField(
                  //   hint: "Email",
                  //   onChanged: (value) {},
                  // ),
                  // RoundedInputField(
                  //   hint: "Alamat",
                  //   onChanged: (value) {},
                  // ),
                ],
              ),
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

  Widget _buildOrderCheckoutTimer() {
    return Center(
      child: BlocBuilder<OrderCheckoutTimerBloc, OrderCheckoutTimerState>(
        builder: (context, state) {
          final String minutesStr =
              ((state.duration / 60) % 60).floor().toString().padLeft(2, '0');
          final String secondsStr =
              (state.duration % 60).floor().toString().padLeft(2, '0');
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$minutesStr:$secondsStr',
                style: kNormalBoldTextStyle,
              ),
              SizedBox(width: 8.0),
              Icon(Icons.help_outline_rounded)
            ],
          );
        },
      ),
    );
  }

  Widget _buildTimeline(BuildContext context) {
    return Container(
      height: 48.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TimelineTile(
            isFirst: true,
            axis: TimelineAxis.horizontal,
            alignment: TimelineAlign.manual,
            lineXY: 0.5,
            afterLineStyle: const LineStyle(color: ColorConst.kSecondaryColor),
            indicatorStyle: IndicatorStyle(
              width: 24.0,
              height: 24.0,
              indicator: Container(
                decoration: const BoxDecoration(
                  color: ColorConst.kSecondaryColor,
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Text(
                    '1',
                    style: TextStyle(
                      color: ColorConst.kThirdColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
          TimelineTile(
            alignment: TimelineAlign.center,
            axis: TimelineAxis.horizontal,
            beforeLineStyle: const LineStyle(color: ColorConst.kSecondaryColor),
            afterLineStyle: const LineStyle(color: Color(0xFFEBEBEB)),
            indicatorStyle: IndicatorStyle(
              width: 24.0,
              height: 24.0,
              indicator: Container(
                decoration: const BoxDecoration(
                  color: ColorConst.kSecondaryColor,
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Text(
                    '2',
                    style: TextStyle(
                      color: ColorConst.kThirdColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
          TimelineTile(
            isLast: true,
            axis: TimelineAxis.horizontal,
            alignment: TimelineAlign.center,
            beforeLineStyle: const LineStyle(color: Color(0xFFEBEBEB)),
            indicatorStyle: IndicatorStyle(
              width: 24.0,
              height: 24.0,
              indicator: Container(
                decoration: const BoxDecoration(
                  color: Color(0xFFD8D8D8),
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Text(
                    '3',
                    style: TextStyle(
                      color: ColorConst.kThirdColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
