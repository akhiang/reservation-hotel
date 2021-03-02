part of 'package:dangau_hotel/screens/screens.dart';

class OrderRoomSummary extends StatefulWidget {
  static const String routeName = "order_room_summary";

  @override
  _OrderRoomSummaryState createState() => _OrderRoomSummaryState();
}

class _OrderRoomSummaryState extends State<OrderRoomSummary> {
  @override
  void initState() {
    super.initState();
    context.read<OrderCheckoutTimerBloc>().add(
          OrderCheckoutTimerStarted(
            // duration: context.read<OrderCheckoutTimerBloc>().state.duration,
            duration: 900,
          ),
        );
  }

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
            Navigator.pushNamed(context, OrderCustomerContact.routeName);
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
                  _buildSelectedRoom(),
                  _buildPriceDetail(context),
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

  Widget _buildOrderCheckoutTimer() {
    return Center(
      child: BlocConsumer<OrderCheckoutTimerBloc, OrderCheckoutTimerState>(
        listener: (context, state) {
          if (state is OrderCheckoutTimerRunComplete) {
            showOrderTimeoutDialog(context);
          }
        },
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

  Widget _buildSelectedRoom() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Pilihan Kamar', style: kNormalTextStyle),
          BlocBuilder<RoomCartCubit, RoomCartState>(
            builder: (_, state) {
              final selectedRooms = (state as RoomCartLoaded).selectedRoomCart;
              return ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: selectedRooms.length,
                itemBuilder: (_, index) {
                  final selectedRoom = selectedRooms[index];
                  return SelectedRoomCard(
                    title: '${selectedRoom.room.name}'.titleCase,
                    subtitle: '${selectedRoom.room.variant}'.titleCase,
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildPriceDetail(BuildContext context) {
    DateState dateState = context.watch<DateCubit>().state;
    double total = context.select<RoomCartCubit, double>((roomCartCubit) =>
        (roomCartCubit.state is RoomCartLoaded)
            ? (roomCartCubit.state as RoomCartLoaded).total *
                dateState.rangeNight
            : 0);
    double ppn = total * 0.1;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Detail Harga', style: kNormalTextStyle),
          SizedBox(height: 16.0),
          Container(
            padding: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: ColorConst.kThirdColor,
              borderRadius: BorderRadius.circular(24.0),
              boxShadow: [kShadow],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    DateFormat('dd MMM yyyy').format(dateState.rangeStartDate) +
                        ' - ' +
                        DateFormat('dd MMM yyyy')
                            .format(dateState.rangeEndDate),
                    style: kNormalBoldTextStyle),
                SizedBox(height: 8.0),
                BlocBuilder<RoomCartCubit, RoomCartState>(
                  builder: (_, state) {
                    final selectedRooms =
                        (state as RoomCartLoaded).selectedRoomCart;
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: selectedRooms.length,
                      itemBuilder: (_, index) {
                        return OrderRoomDetail(
                            selectedRoom: selectedRooms[index]);
                      },
                    );
                  },
                ),
                SizedBox(height: 16.0),
                Divider(
                  color: ColorConst.kSecondaryColor.withOpacity(0.5),
                  thickness: 1.0,
                ),
                SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total', style: kNormalTextStyle),
                    Text(Helper.priceFormat(total),
                        style: kNormalBoldTextStyle),
                  ],
                ),
                SizedBox(height: 4.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('PPN', style: kNormalTextStyle),
                    Text(Helper.priceFormat(ppn), style: kNormalBoldTextStyle),
                  ],
                ),
                SizedBox(height: 4.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Grand Total', style: kNormalTextStyle),
                    Text(Helper.priceFormat(total + ppn),
                        style: kNormalBoldTextStyle),
                  ],
                ),
                SizedBox(height: 4.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Bayar Sekarang', style: kNormalBoldTextStyle),
                    Text(Helper.priceFormat(total + ppn),
                        style: kNormalBoldTextStyle),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
