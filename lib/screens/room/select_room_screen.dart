part of 'package:dangau_hotel/screens/screens.dart';

class SelectRoomScreen extends StatefulWidget {
  static const String routeName = "select_room_screen";

  final Hotel hotel;

  const SelectRoomScreen({
    Key key,
    @required this.hotel,
  }) : super(key: key);

  @override
  _SelectRoomScreenState createState() => _SelectRoomScreenState();
}

class _SelectRoomScreenState extends State<SelectRoomScreen> {
  DateState dateState;
  DateRangePickerController _datePickerController;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    dateState = context.watch<DateCubit>().state;
    _datePickerController = DateRangePickerController();
    _datePickerController.selectedRange =
        PickerDateRange(dateState.rangeStartDate, dateState.rangeEndDate);
  }

  void _loadHotelRoomListToCart() {
    context.read<RoomCartCubit>().getHotelRoomsToCart(widget.hotel.id);
  }

  void _showDateCalenderBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
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
              children: [
                Text(
                  'Pilih Tanggal',
                  style: kNormalTextStyle,
                ),
                SizedBox(height: 16.0),
                _buildCalender(),
                Container(
                  width: double.infinity,
                  height: 48.0,
                  margin: EdgeInsets.all(16.0),
                  child: PrimaryButton(
                    text: 'Cek Kamar',
                    press: () {
                      _loadHotelRoomListToCart();
                      Navigator.pop(context);
                    },
                  ),
                ),
                SizedBox(height: 32.0),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showSummaryBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Wrap(
        children: [
          Container(
            decoration: new BoxDecoration(
              color: ColorConst.kThirdColor,
              borderRadius: new BorderRadius.only(
                topLeft: const Radius.circular(24.0),
                topRight: const Radius.circular(24.0),
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
                  children: [
                    DragIndicator(),
                    SizedBox(height: 16.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24.0, vertical: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Ringkasan Harga', style: kLargeBoldTextStyle),
                          SizedBox(height: 8.0),
                          Text(
                              '${dateState.rangeNight} Malam, $roomTotal Kamar',
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
                                color: ColorConst.kSecondaryColor
                                    .withOpacity(0.5)),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Total Harga', style: kNormalBoldTextStyle),
                              Text(Helper.priceFormat(total.toDouble()),
                                  style: kNormalBoldTextStyle),
                            ],
                          ),
                          SizedBox(height: 40.0),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    context
        .read<DateCubit>()
        .changeRangeDate(args.value.startDate, args.value.endDate);
  }

  SfDateRangePicker _buildCalender() {
    return SfDateRangePicker(
      onSelectionChanged: _onSelectionChanged,
      view: DateRangePickerView.month,
      controller: _datePickerController,
      selectionMode: DateRangePickerSelectionMode.range,
      showNavigationArrow: false,
      headerStyle: DateRangePickerHeaderStyle(
        textAlign: TextAlign.center,
        textStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          letterSpacing: 5,
          color: ColorConst.kSecondaryColor,
        ),
      ),
      enablePastDates: false,
      selectionTextStyle: const TextStyle(
          color: ColorConst.kSecondaryColor, fontWeight: FontWeight.w600),
      startRangeSelectionColor: ColorConst.kPrimaryColor,
      endRangeSelectionColor: ColorConst.kPrimaryColor,
      rangeSelectionColor: ColorConst.kPrimaryColor.withOpacity(0.3),
      rangeTextStyle: const TextStyle(
          color: ColorConst.kSecondaryColor, fontWeight: FontWeight.w600),
      monthViewSettings: DateRangePickerMonthViewSettings(
        // enableSwipeSelection: false,
        weekendDays: <int>[7],
        showTrailingAndLeadingDates: true,
        viewHeaderStyle: DateRangePickerViewHeaderStyle(
          textStyle: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w600,
              letterSpacing: 5,
              color: ColorConst.kSecondaryColor),
        ),
      ),
      monthCellStyle: DateRangePickerMonthCellStyle(
        weekendTextStyle: TextStyle(color: Colors.red),
        todayTextStyle: TextStyle(
            color: ColorConst.kSecondaryColor, fontWeight: FontWeight.w500),
        todayCellDecoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(width: 1),
        ),
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: GestureDetector(
                  onTap: () {
                    _showDateCalenderBottomSheet(context);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    decoration: BoxDecoration(
                      color: ColorConst.kSecondaryColor.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          DateFormat('dd MMM yyyy')
                              .format(dateState.rangeStartDate),
                          style: kNormalBoldTextStyle,
                        ),
                        Text('-', style: kNormalBoldTextStyle),
                        Text(
                          DateFormat('dd MMM yyyy')
                              .format(dateState.rangeEndDate),
                          style: kNormalBoldTextStyle,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: RoomList(hotel: widget.hotel),
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
                    Navigator.pushNamed(context, OrderRoomSummary.routeName);
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
