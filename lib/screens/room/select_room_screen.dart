part of 'package:dangau_hotel/screens/screens.dart';

class SelectRoom extends StatelessWidget {
  final Hotel hotel;

  const SelectRoom({
    Key key,
    @required this.hotel,
  }) : super(key: key);

  void _showSummaryBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Wrap(
        children: [
          Container(
            padding: EdgeInsets.all(32.0),
            decoration: new BoxDecoration(
              color: ColorConst.kThirdColor,
              borderRadius: new BorderRadius.only(
                topLeft: const Radius.circular(25.0),
                topRight: const Radius.circular(25.0),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ringkasan Harga',
                  style: kLargeBoldTextStyle,
                ),
                SizedBox(height: 8.0),
                Text('3 Malam, 2 Kamar', style: kNormalBoldTextStyle),
                SizedBox(height: 8.0),
                SummaryRoomListTile(),
                SummaryRoomListTile(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Divider(
                      color: ColorConst.kSecondaryColor.withOpacity(0.5)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total Harga', style: kNormalBoldTextStyle),
                    Text('Rp4200000', style: kNormalBoldTextStyle),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(88.0),
        child: CustomAppBar(title: 'Pilih Kamar', isLeading: true),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: RoomList(hotel: hotel),
              ),
            ],
          ),
          _buildBottomCheckoutButton(context),
        ],
      ),
    );
  }

  Widget _buildBottomCheckoutButton(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        color: Colors.transparent,
        height: 68.0,
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                _showSummaryBottomSheet(context);
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                width: SizeConfig.screenWidth(context) * 0.4,
                decoration: BoxDecoration(
                  color: ColorConst.kThirdColor,
                  borderRadius: BorderRadius.circular(32.0),
                  boxShadow: [
                    BoxShadow(
                      color: ColorConst.kSecondaryColor.withOpacity(0.15),
                      offset: Offset(0.0, 5.0),
                      blurRadius: 20.0,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Total',
                          style: TextStyle(
                            color: ColorConst.kSecondaryColor,
                            fontSize: 12.0,
                          ),
                        ),
                        Text(
                          'Rp1400000',
                          style: TextStyle(
                            color: ColorConst.kSecondaryColor,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                    Icon(FontAwesomeIcons.chevronUp, size: 16.0),
                  ],
                ),
              ),
            ),
            SizedBox(width: 8.0),
            Expanded(
              child: SizedBox(
                height: 56.0,
                child: PrimaryButton(
                  text: 'Pesan Sekarang',
                  press: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => OrderPaymentScreen(),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
