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
                Text('Ringkasan Harga', style: kLargeBoldTextStyle),
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
        child: CustomAppBar(title: 'Kamar Yang Tersedia', isLeading: true),
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
          BlocBuilder<OrderingStatusCubit, OrderingStatusState>(
            builder: (context, state) {
              if (state is OrderingStatusInitial) {
                return SizedBox();
              } else if (state is OrderingStatusOnRoomSelection) {
                return _buildChangeDateButton();
              } else if (state is OrderingStatusOnRoomSelected) {
                return _buildBottomCheckoutButton(context);
              }
              return SizedBox();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildChangeDateButton() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 112.0, vertical: 8.0),
        color: Colors.transparent,
        height: 68.0,
        child: PrimaryButton(
          text: 'Ubah Tanggal',
          press: () {
            // _showDateCalenderBottomSheet();
          },
        ),
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
                        Text('Total', style: kSmallTextStyle),
                        BlocBuilder<RoomCartCubit, RoomCartState>(
                          builder: (context, state) {
                            if (state is RoomCartLoading) {
                              return Text('Rp0', style: kNormalBoldTextStyle);
                            }
                            if (state is RoomCartLoaded) {
                              final List<RoomCart> selectedRoomCart =
                                  state.roomCart.where((room) {
                                return room.quantity > 0;
                              }).toList();
                              final int total = selectedRoomCart.fold(
                                  0,
                                  (sum, item) =>
                                      sum + (item.quantity * item.room.price));
                              return Text(
                                  NumberFormat.currency(
                                          locale: 'id',
                                          symbol: 'Rp',
                                          decimalDigits: 0)
                                      .format(total),
                                  style: kNormalBoldTextStyle);
                            }
                            return Text('Rp0', style: kNormalBoldTextStyle);
                          },
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
