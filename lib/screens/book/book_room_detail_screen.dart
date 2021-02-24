part of 'package:dangau_hotel/screens/screens.dart';

class BookRoomDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(88.0),
        child: CustomAppBar(title: 'Kahyangan Resort', isLeading: true),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Detail Pesanan',
                    style: TextStyle(
                      color: ColorConst.kSecondaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 20.0,
                      letterSpacing: 1.2,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color:
                                  ColorConst.kSecondaryColor.withOpacity(0.3)),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Total Pembayaran', style: kNormalTextStyle),
                            SizedBox(height: 8.0),
                            Text(
                              Helper.priceFormat(999999),
                              style: TextStyle(
                                color: ColorConst.kSecondaryColor,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 16.0),
                  _buildHotelTile(),
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Divider(
                          color: ColorConst.kSecondaryColor.withOpacity(0.5))),
                  _buildBookDescription(),
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Divider(
                          color: ColorConst.kSecondaryColor.withOpacity(0.5))),
                  _buildSelectedRoom(),
                ],
              ),
            ),
            BookRoomDetailShimmer(),
          ],
        ),
      ),
    );
  }

  Widget _buildBookDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Detail Tamu',
          style: kNormalBoldTextStyle,
        ),
        SizedBox(height: 4.0),
        Text(
          'Lorem ipsum',
          style: kNormalTextStyle,
        ),
        SizedBox(height: 16.0),
        SizedBox(height: 8.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Jam Check-in',
                  style: kNormalTextStyle,
                ),
                SizedBox(height: 4.0),
                Text(
                  '14.00 - 23.59',
                  style: kNormalBoldTextStyle,
                ),
              ],
            ),
            SizedBox(width: 32.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Jam Check-out',
                  style: kNormalTextStyle,
                ),
                SizedBox(height: 4.0),
                Text(
                  '01.00 - 12.00',
                  style: kNormalBoldTextStyle,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildHotelTile() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
          child: SizedBox(
            width: 98.0,
            child: AspectRatio(
              aspectRatio: 1.0,
              child: Image(
                image: AssetImage('assets/images/pexels-pixabay-258154.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(width: 12.0),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Kahyangan Resort',
              style: kNormalBoldTextStyle,
            ),
            SizedBox(height: 4.0),
            Text(
              '3 Malam, 2 Kamar',
              style: kNormalTextStyle,
            ),
            SizedBox(height: 4.0),
            Text(
              '15 - 18 Des, 2020',
              style: kNormalTextStyle,
            ),
            SizedBox(height: 4.0),
            Container(
              padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
              decoration: BoxDecoration(
                color: ColorConst.kErrorColor.withOpacity(0.15),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                'Dibatalkan',
                style: TextStyle(
                  color: ColorConst.kErrorColor,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSelectedRoom() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '2 Kamar',
          style: kNormalBoldTextStyle,
        ),
        SelectedRoomListTile(),
        SelectedRoomListTile(),
      ],
    );
  }
}

class SelectedRoomListTile extends StatelessWidget {
  const SelectedRoomListTile({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Deluxe Twin With Balcony',
            style: kNormalTextStyle,
          ),
          SizedBox(height: 8.0),
          Row(
            children: [
              Text(
                'Non-Smoking',
                style: kNormalTextStyle,
              ),
              SizedBox(width: 16.0),
              Icon(Icons.lens,
                  size: 8.0,
                  color: ColorConst.kSecondaryColor.withOpacity(0.5)),
              SizedBox(width: 16.0),
              Text(
                'Single Bed',
                style: kNormalTextStyle,
              ),
            ],
          ),
          SizedBox(height: 8.0),
          Row(
            children: [
              Text(
                '1 Kamar',
                style: kNormalTextStyle,
              ),
              SizedBox(width: 16.0),
              Icon(Icons.lens,
                  size: 8.0,
                  color: ColorConst.kSecondaryColor.withOpacity(0.5)),
              SizedBox(width: 16.0),
              Text(
                '1 Tamu',
                style: kNormalTextStyle,
              ),
            ],
          ),
          SizedBox(height: 8.0),
          Text(
            'Catatan',
            style: kNormalBoldTextStyle,
          ),
          SizedBox(height: 8.0),
          Text(
            'Tidak perlu selimut',
            style: kNormalTextStyle,
          ),
        ],
      ),
    );
  }
}
