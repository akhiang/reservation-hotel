part of 'package:dangau_hotel/screens/screens.dart';

class FindHotelScreen extends StatefulWidget {
  @override
  _FindHotelScreenState createState() => _FindHotelScreenState();
}

class _FindHotelScreenState extends State<FindHotelScreen> {
  @override
  void initState() {
    super.initState();
  }

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    print(args);
  }

  void _showDateCalenderBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useRootNavigator: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.75,
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
              style: TextStyle(
                  color: ColorConst.kSecondaryColor,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 16.0),
            _buildCalender(),
            Container(
              width: double.infinity,
              height: 40.0,
              margin: EdgeInsets.all(16.0),
              child: PrimaryButton(
                text: 'Cari Hotel',
                press: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }

  SfDateRangePicker _buildCalender() {
    return SfDateRangePicker(
      onSelectionChanged: _onSelectionChanged,
      view: DateRangePickerView.month,
      selectionMode: DateRangePickerSelectionMode.range,
      showNavigationArrow: false,
      enablePastDates: false,
      selectionTextStyle: const TextStyle(
          color: ColorConst.kSecondaryColor, fontWeight: FontWeight.w600),
      startRangeSelectionColor: ColorConst.kPrimaryColor,
      endRangeSelectionColor: ColorConst.kPrimaryColor,
      rangeSelectionColor: ColorConst.kPrimaryColor.withOpacity(0.3),
      rangeTextStyle: const TextStyle(
          color: ColorConst.kSecondaryColor, fontWeight: FontWeight.w600),
      monthViewSettings: DateRangePickerMonthViewSettings(
        weekendDays: <int>[7],
        showTrailingAndLeadingDates: true,
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
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(88.0),
        child: CustomAppBar(
          title: 'Hotel Yang Tersedia',
          isLeading: true,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Tanggal',
              style: TextStyle(
                color: ColorConst.kSecondaryColor,
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  '29 Des 2020',
                  style: TextStyle(
                    color: ColorConst.kSecondaryColor,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  ' - ',
                  style: TextStyle(
                    color: ColorConst.kSecondaryColor,
                    fontSize: 18.0,
                  ),
                ),
                Text(
                  '02 Jan 2020',
                  style: TextStyle(
                    color: ColorConst.kSecondaryColor,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
                itemCount: hotels.length,
                itemBuilder: (_, index) {
                  Hotel hotel = hotels[index];
                  return _buildHotelCard(hotel);
                },
              ),
            ),
            SizedBox(height: 16.0),
            SizedBox(
              width: 120.0,
              height: 40.0,
              child: RaisedButton(
                onPressed: () {
                  _showDateCalenderBottomSheet();
                },
                child: Text(
                  'Ubah Tanggal',
                  style: TextStyle(color: ColorConst.kSecondaryColor),
                ),
                color: ColorConst.kPrimaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHotelCard(Hotel hotel) {
    return GestureDetector(
      onTap: () {
        print(hotel.name);
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => HotelScreen5(
              hotel: hotel,
            ),
          ),
        );
      },
      child: Container(
        height: 160,
        margin: EdgeInsets.symmetric(vertical: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(hotel.imageUrl),
          ),
        ),
        child: Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Colors.black.withOpacity(0.30),
                Colors.black.withOpacity(0),
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    hotel.name,
                    style: TextStyle(
                      color: ColorConst.kThirdColor,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.2,
                    ),
                  ),
                  Text(
                    '⭐⭐⭐⭐⭐',
                    style: TextStyle(
                      fontSize: 10.0,
                      letterSpacing: 1.2,
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Mulai dari:',
                        style: TextStyle(
                          color: ColorConst.kThirdColor,
                          fontSize: 14.0,
                          letterSpacing: 1.2,
                        ),
                      ),
                      Text(
                        'Rp700.000',
                        style: TextStyle(
                          color: ColorConst.kThirdColor,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.4,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Icon(
                        FontAwesomeIcons.doorOpen,
                        color: ColorConst.kThirdColor,
                        size: 18.0,
                      ),
                      SizedBox(width: 8.0),
                      Text(
                        '20',
                        style: TextStyle(
                          color: ColorConst.kThirdColor,
                          fontSize: 14.0,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
