part of 'package:dangau_hotel/screens/screens.dart';

class OrderTerm extends StatefulWidget {
  static const String routeName = "order_term";

  @override
  _OrderTermState createState() => _OrderTermState();
}

class _OrderTermState extends State<OrderTerm> {
  bool _acceptCheckboxListTile = false;
  bool _isInit = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(88.0),
        child: CustomAppBar(title: 'Syarat & Ketentuan', isLeading: true),
      ),
      extendBody: true,
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 104.0),
        height: 80.0,
        child: PrimaryButton(
          text: 'Selesai',
          press: () {
            if (_acceptCheckboxListTile) {
              Navigator.pushNamed(context, OrderPaymentScreen.routeName);
            } else {
              setState(() {
                _isInit = false;
              });
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
                  _buildTermList(),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircularCheckBox(
                              value: _acceptCheckboxListTile,
                              disabledColor: Colors.grey,
                              onChanged: (value) => this.setState(() {
                                _acceptCheckboxListTile =
                                    !_acceptCheckboxListTile;
                              }),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () => setState(() {
                                  _acceptCheckboxListTile =
                                      !_acceptCheckboxListTile;
                                }),
                                child: Container(
                                  color: ColorConst.kThirdColor,
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                      'Saya Setuju dengan Syarat & Ketentuan yang berlaku',
                                      style: kNormalBoldTextStyle),
                                ),
                              ),
                            ),
                          ],
                        ),
                        !_isInit
                            ? !_acceptCheckboxListTile
                                ? Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0),
                                    child: Text(
                                      'Mohon dicentang',
                                      style: TextStyle(
                                        color: ColorConst.kErrorColor,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  )
                                : SizedBox()
                            : SizedBox(),
                      ],
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

  Widget _buildTermList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      child: Column(
        children: [
          OrderTermTile(title: 'Lorem Ipsum Dolor Sit Amet Adiuvat'),
          OrderTermTile(
              title: 'Lorem ipsum dolor sit amet consectetur adipiscing elit.'),
          OrderTermTile(
              title:
                  'Proin gravida senectus felis lacinia eget sed tristique.'),
          OrderTermTile(title: 'Lorem Ipsum Dolor Sit Amet Adiuvat'),
          OrderTermTile(
              title: 'Lorem ipsum dolor sit amet consectetur adipiscing elit.'),
          OrderTermTile(
              title:
                  'Proin gravida senectus felis lacinia eget sed tristique.'),
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
            beforeLineStyle: const LineStyle(color: ColorConst.kSecondaryColor),
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
