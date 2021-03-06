part of 'package:dangau_hotel/screens/screens.dart';

class HotelInformation extends StatefulWidget {
  final Hotel hotel;

  const HotelInformation({
    Key key,
    this.hotel,
  }) : super(key: key);

  @override
  _HotelInformationState createState() => _HotelInformationState();
}

class _HotelInformationState extends State<HotelInformation>
    with AutomaticKeepAliveClientMixin {
  DateState dateState;
  DateRangePickerController _datePickerController;

  @override
  bool get wantKeepAlive => true;

  @override
  initState() {
    super.initState();
    context.read<OrderingStatusCubit>().changeStatusToInitial();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    dateState = context.watch<DateCubit>().state;
    _datePickerController = DateRangePickerController();
    _datePickerController.selectedRange =
        PickerDateRange(dateState.rangeStartDate, dateState.rangeEndDate);
  }

  void _showDateCalenderBottomSheet() {
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
                      Navigator.pop(context);
                      Navigator.pushNamed(context, SelectRoomScreen.routeName,
                          arguments: widget.hotel);
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
    super.build(context);
    return BlocConsumer<HotelDetailBloc, HotelDetailState>(
      listener: (_, state) {
        if (state is HotelDetailError) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text('error'),
            ),
          );
        }
      },
      builder: (_, state) {
        if (state is HotelDetailLoading) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: HotelInformationShimmer(),
          );
        } else if (state is HotelDetailLoaded) {
          return Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    _buildDescription(state.hotel.description),
                    _buildContact(),
                    // _buildFacility(state.hotel.facilities),
                    // _buildHotelRoom(context, state.hotel.rooms),
                    SizedBox(height: 88.0),
                  ],
                ),
              ),
              _buildBottomOrderButton()
            ],
          );
        } else {
          return Text("error");
        }
      },
    );
  }

  Widget _buildBottomOrderButton() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 88.0, vertical: 8.0),
        color: Colors.transparent,
        height: 68.0,
        child: PrimaryButton(
          text: 'Lakukan Pemesanan',
          press: () {
            _showDateCalenderBottomSheet();
          },
        ),
      ),
    );
  }

  Padding _buildDescription(String description) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
      child: Text(
        description,
        style: TextStyle(
          color: ColorConst.kSecondaryColor,
          height: 1.4,
        ),
        textAlign: TextAlign.justify,
      ),
    );
  }

  Padding _buildContact() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
      child: Column(
        children: [
          HotelContactListTile(
            icon: FontAwesomeIcons.mapMarkerAlt,
            text: '${widget.hotel.address}',
          ),
          HotelContactListTile(
            icon: Icons.phone,
            text: '${widget.hotel.phone}',
          ),
          HotelContactListTile(
            icon: Icons.email,
            text: '${widget.hotel.email}',
          ),
        ],
      ),
    );
  }

  Padding _buildFacility(List<Facility> facilities) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Fasilitas",
            style: TextStyle(
              color: ColorConst.kSecondaryColor,
              fontWeight: FontWeight.w600,
              fontSize: 18,
              letterSpacing: 1.2,
            ),
          ),
          SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FacilityCard(icon: Icons.restaurant, title: 'Restoran'),
              FacilityCard(icon: FontAwesomeIcons.swimmingPool, title: 'Kolam'),
              FacilityCard(icon: FontAwesomeIcons.wifi, title: 'Wi-Fi'),
              FacilityCard(icon: FontAwesomeIcons.thLarge, title: 'Lainnya'),
            ],
          ),
        ],
      ),
    );
  }

  // Widget _buildHotelRoom(BuildContext context, List<Room> rooms) {
  //   return Padding(
  //     padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Text(
  //           "Kamar Tersedia",
  //           style: TextStyle(
  //             color: ColorConst.kSecondaryColor,
  //             fontWeight: FontWeight.w600,
  //             fontSize: 18.0,
  //             letterSpacing: 1.2,
  //           ),
  //         ),
  //         SizedBox(height: 8.0),
  //         Container(
  //           child: ListView.builder(
  //             shrinkWrap: true,
  //             physics: NeverScrollableScrollPhysics(),
  //             padding: EdgeInsets.zero,
  //             itemCount: rooms.length,
  //             itemBuilder: (_, index) {
  //               return RoomCard(
  //                 roomCart: rooms[index],
  //                 press: () {
  //                   Navigator.push(
  //                     context,
  //                     MaterialPageRoute(
  //                       builder: (context) => RoomPreferenceScreen(),
  //                     ),
  //                   );
  //                 },
  //               );
  //             },
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }
}
