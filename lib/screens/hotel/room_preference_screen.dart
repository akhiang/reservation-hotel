part of 'package:dangau_hotel/screens/screens.dart';

class RoomPreferenceScreen extends StatefulWidget {
  @override
  _RoomPreferenceScreenState createState() => _RoomPreferenceScreenState();
}

class _RoomPreferenceScreenState extends State<RoomPreferenceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(88.0),
        child: CustomAppBar(title: 'Preferensi Kamar', isLeading: true),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Deluxe Twin",
                      style: TextStyle(
                        color: ColorConst.kSecondaryColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 16.0,
                      ),
                    ),
                    TextSpan(
                      text: " with Balcony",
                      style: TextStyle(
                        color: ColorConst.kSecondaryColor,
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            _buildSmokeRadio(),
            _buildBedRadio(),
            SizedBox(height: 8.0),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              width: double.infinity,
              height: 56.0,
              child: PrimaryButton(
                text: 'Tambah Catatan',
                color: Color(0xFFF5F9FF),
                press: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding _buildSmokeRadio() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Smoking / Non-Smoking',
            style: TextStyle(
              color: ColorConst.kSecondaryColor,
              fontWeight: FontWeight.w600,
              fontSize: 16.0,
            ),
          ),
          SizedBox(height: 16.0),
          Row(
            children: [
              RadioButton(
                title: 'Smoking',
              ),
              SizedBox(width: 16.0),
              RadioButton(title: 'Non-Smoking'),
            ],
          ),
        ],
      ),
    );
  }

  Padding _buildBedRadio() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Single Bed / Twin Bed',
            style: TextStyle(
              color: ColorConst.kSecondaryColor,
              fontWeight: FontWeight.w600,
              fontSize: 16.0,
            ),
          ),
          SizedBox(height: 16.0),
          Row(
            children: [
              RadioButton(
                title: 'Single Bed',
              ),
              SizedBox(width: 16.0),
              RadioButton(title: 'Twin Bed'),
            ],
          ),
        ],
      ),
    );
  }
}
