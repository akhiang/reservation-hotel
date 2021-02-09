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
  DateTime rangeStartDate = DateTime.now();
  DateTime rangeEndDate = DateTime.now().add(Duration(days: 1));
  DateRangePickerController _datePickerController;

  @override
  bool get wantKeepAlive => true;

  @override
  initState() {
    _datePickerController = DateRangePickerController();
    _datePickerController.selectedRange =
        PickerDateRange(rangeStartDate, rangeEndDate);
    super.initState();
    _loadHotelDetail();
    context.read<OrderingStatusCubit>().changeStatusToInitial();
  }

  void _loadHotelDetail() {
    context.read<HotelDetailBloc>().add(GetHotelDetail(widget.hotel.id));
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
                      if (rangeStartDate == null && rangeEndDate == null) {
                        Fluttertoast.cancel();
                        Fluttertoast.showToast(
                            msg: "Mohon pilih tanggal",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: ColorConst.kSecondaryColor,
                            textColor: ColorConst.kThirdColor,
                            fontSize: 16.0);
                      } else {
                        context
                            .read<OrderingStatusCubit>()
                            .changeStatusToOnRoomSelection();
                        Navigator.pop(context);
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                SelectRoom(hotel: widget.hotel),
                          ),
                        );
                      }
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
    rangeStartDate = args.value.startDate;
    rangeEndDate = args.value.endDate;
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

  void _showSummaryBottomSheet() {
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
                  style: TextStyle(
                    color: ColorConst.kSecondaryColor,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  '3 Malam, 2 Kamar',
                  style: TextStyle(
                    color: ColorConst.kSecondaryColor,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
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
                    Text(
                      'Total Harga',
                      style: TextStyle(
                        color: ColorConst.kSecondaryColor,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'Rp4200000',
                      style: TextStyle(
                        color: ColorConst.kSecondaryColor,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
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
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is HotelDetailLoaded) {
          return Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    _buildDescription(state.hotel.description),
                    _buildContact(),
                    _buildFacility(state.hotel.facilities),
                    // _buildHotelRoom(context, state.hotel.rooms),
                    SizedBox(height: 88.0),
                  ],
                ),
              ),
              BlocBuilder<OrderingStatusCubit, OrderingStatusState>(
                builder: (context, state) {
                  if (state is OrderingStatusInitial) {
                    return _buildBottomOrderButton();
                  } else if (state is OrderingStatusOnRoomSelection) {
                    return _buildChangeDateButton();
                  } else if (state is OrderingStatusOnRoomSelected) {
                    return _buildBottomCheckoutButton(context);
                  }
                  return _buildBottomOrderButton();
                },
              ),
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
            _showDateCalenderBottomSheet();
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
                _showSummaryBottomSheet();
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
            text:
                "Jl. Raya Tj. Gundul, Karimunting, Sungai Raya Kepulauan, Kabupaten Bengkayang, Kal-Bar 79271",
          ),
          HotelContactListTile(
            icon: Icons.phone,
            text: "+62 7187655856",
          ),
          HotelContactListTile(
            icon: Icons.email,
            text: "resortkahyangan@gmail.com",
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
