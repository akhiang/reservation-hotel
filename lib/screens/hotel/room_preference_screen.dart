part of 'package:dangau_hotel/screens/screens.dart';

class RoomPreferenceScreen extends StatefulWidget {
  @override
  _RoomPreferenceScreenState createState() => _RoomPreferenceScreenState();
}

class _RoomPreferenceScreenState extends State<RoomPreferenceScreen> {
  bool isNote = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(88.0),
        child: CustomAppBar(title: 'Preferensi Kamar', isLeading: true),
      ),
      bottomNavigationBar: Container(
        height: 64.0,
        color: Colors.transparent,
        child: Center(
          child: SizedBox(
            height: 40.0,
            width: 120.0,
            child: PrimaryButton(
              text: 'Simpan',
              press: () {},
            ),
          ),
        ),
      ),
      body: Container(
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 24.0),
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
              _buildSmokeRadioButton(),
              _buildBedRadioButton(),
              SizedBox(height: 8.0),
              isNote
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: RoundedTextArea(
                        line: 4,
                        hint: "Catatan",
                        onChanged: (value) {},
                      ),
                    )
                  : Container(
                      padding: EdgeInsets.symmetric(horizontal: 24.0),
                      width: double.infinity,
                      height: 52.0,
                      child: ShadowButton(
                        icon: Icons.add,
                        text: 'Tambah Catatan',
                        press: () {
                          print('note');
                          setState(() {
                            isNote = true;
                          });
                        },
                      ),
                    ),
              // SizedBox(height: 88.0),
            ],
          ),
        ),
      ),
    );
  }

  Padding _buildSmokeRadioButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
            decoration: BoxDecoration(
              color: ColorConst.kThirdColor,
              borderRadius: BorderRadius.circular(16.0),
              boxShadow: [
                BoxShadow(
                  color: ColorConst.kSecondaryColor.withOpacity(0.15),
                  offset: Offset(0.0, 5.0),
                  blurRadius: 20.0,
                ),
              ],
            ),
            child: Column(
              children: [
                RadioButton(title: 'Smoking', icon: Icons.smoking_rooms),
                RadioButton(title: 'Non-Smoking', icon: Icons.smoke_free),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Padding _buildBedRadioButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
            decoration: BoxDecoration(
              color: ColorConst.kThirdColor,
              borderRadius: BorderRadius.circular(16.0),
              boxShadow: [
                BoxShadow(
                  color: ColorConst.kSecondaryColor.withOpacity(0.15),
                  offset: Offset(0.0, 5.0),
                  blurRadius: 20.0,
                ),
              ],
            ),
            child: Column(
              children: [
                RadioButton(title: 'Single Bed', icon: Icons.access_alarm),
                RadioButton(title: 'Twin Bed', icon: Icons.access_alarm)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
