part of 'package:dangau_hotel/screens/screens.dart';

class SelectRoomScreen extends StatelessWidget {
  final Hotel hotel;

  const SelectRoomScreen({
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
            child: BlocBuilder<RoomCartCubit, RoomCartState>(
              builder: (context, state) {
                DateState dateState = context.watch<DateCubit>().state;
                final selectedRooms =
                    (state as RoomCartLoaded).selectedRoomCart;
                final int roomTotal =
                    selectedRooms.fold(0, (sum, item) => sum + (item.quantity));
                final int total = selectedRooms.fold(
                    0,
                    (sum, item) =>
                        sum +
                        (dateState.rangeNight *
                            item.quantity *
                            item.room.price));
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Ringkasan Harga', style: kLargeBoldTextStyle),
                    SizedBox(height: 8.0),
                    Text('${dateState.rangeNight} Malam, $roomTotal Kamar',
                        style: kNormalBoldTextStyle),
                    SizedBox(height: 8.0),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: selectedRooms.length,
                      itemBuilder: (context, index) {
                        return SummaryRoomListTile(
                          selectedRoom: selectedRooms[index],
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Divider(
                          color: ColorConst.kSecondaryColor.withOpacity(0.5)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total Harga', style: kNormalBoldTextStyle),
                        Text(Helper.priceFormat(total.toDouble()),
                            style: kNormalBoldTextStyle),
                      ],
                    )
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    DateState dateState = context.watch<DateCubit>().state;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(88.0),
        child: CustomAppBar(title: 'Kamar Yang Tersedia', isLeading: true),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Text('Tanggal', style: kNormalBoldTextStyle),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    DateFormat('dd MMM yyyy').format(dateState.rangeStartDate),
                    style: kNormalBoldTextStyle,
                  ),
                  Text('-', style: kNormalBoldTextStyle),
                  Text(
                    DateFormat('dd MMM yyyy').format(dateState.rangeEndDate),
                    style: kNormalBoldTextStyle,
                  ),
                ],
              ),
              Expanded(
                child: RoomList(hotel: hotel),
              ),
            ],
          ),
          BlocBuilder<RoomCartCubit, RoomCartState>(
            builder: (context, state) {
              if (state is RoomCartInitial) {
                return SizedBox();
              } else if (state is RoomCartLoading) {
                return SizedBox();
              } else if (state is RoomCartLoaded) {
                if (state.selectedRoomCart.isEmpty) {
                  return SizedBox();
                } else {
                  return _buildBottomCheckoutButton(context);
                }
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
    DateState dateState = context.watch<DateCubit>().state;
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
            Expanded(
              child: GestureDetector(
                onTap: () {
                  _showSummaryBottomSheet(context);
                },
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
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
                                final int total = state.selectedRoomCart.fold(
                                    0,
                                    (sum, item) =>
                                        sum +
                                        (dateState.rangeNight *
                                            item.quantity *
                                            item.room.price));
                                return Text(
                                    Helper.priceFormat(total.toDouble()),
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
                          builder: (context) => OrderRoomSummary()),
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
