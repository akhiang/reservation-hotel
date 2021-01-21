part of 'package:dangau_hotel/screens/screens.dart';

class HelpRefundScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(88.0),
        child: CustomAppBar(title: 'Bantuan', isLeading: true),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            SizedBox(height: 16.0),
            Text(
              'Kontak :',
              style: TextStyle(
                color: ColorConst.kSecondaryColor,
                fontWeight: FontWeight.w600,
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
