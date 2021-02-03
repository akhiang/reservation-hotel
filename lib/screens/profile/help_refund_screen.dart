part of 'package:dangau_hotel/screens/screens.dart';

class HelpRefundScreen extends StatefulWidget {
  @override
  _HelpRefundScreenState createState() => _HelpRefundScreenState();
}

class _HelpRefundScreenState extends State<HelpRefundScreen> {
  String _valHotel;
  List _listHotel = ["Kahyangan Resort", "Dangau Resort", "Dangau Hotel"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(88.0),
        child: CustomAppBar(title: 'Bantuan', isLeading: true),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Saya ingin melakukan refund',
                style: TextStyle(
                  color: ColorConst.kSecondaryColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris risus diam consectetur ultrices et. Proin gravida senectus felis lacinia eget sed tristique.',
                style: TextStyle(
                  color: ColorConst.kSecondaryColor,
                  fontSize: 16.0,
                ),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 40.0),
              Text(
                'Kontak :',
                style: TextStyle(
                  color: ColorConst.kSecondaryColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 16.0,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8.0),
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                decoration: BoxDecoration(
                  color: ColorConst.kSecondaryColor.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(32.0),
                ),
                child: DropdownButtonHideUnderline(
                  child: Theme(
                    data: Theme.of(context).copyWith(
                      canvasColor: Color(0xFFEAEEF5),
                    ),
                    child: DropdownButton(
                      isExpanded: true,
                      hint: Text(
                        "Hotel yang anda pesan",
                        style: TextStyle(
                          color: ColorConst.kSecondaryColor.withOpacity(0.6),
                        ),
                      ),
                      value: _valHotel,
                      items: _listHotel.map((value) {
                        return DropdownMenuItem(
                          child: Text(
                            value,
                            style: TextStyle(
                              color: ColorConst.kSecondaryColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          value: value,
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _valHotel = value;
                        });
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHotelContact(Icons.phone, '+62 123124125332'),
                    SizedBox(height: 16.0),
                    _buildHotelContact(
                        Icons.email, 'resortkahyangan@gmail.com'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHotelContact(IconData icon, String text) {
    return Row(
      children: [
        Icon(
          icon,
          size: 32.0,
          color: ColorConst.kErrorColor,
        ),
        SizedBox(width: 8.0),
        Text(
          text,
          style: TextStyle(
            color: ColorConst.kSecondaryColor,
            fontSize: 16.0,
          ),
        ),
      ],
    );
  }
}
