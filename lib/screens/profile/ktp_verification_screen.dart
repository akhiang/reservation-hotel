part of 'package:dangau_hotel/screens/screens.dart';

class KtpVerificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(88.0),
        child: CustomAppBar(title: 'Verifikasi KTP', isLeading: true),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text('Upload Foto KTP Anda', style: kLargeBoldTextStyle),
            _buildPhoto(context),
            _buildTerm(),
          ],
        ),
      ),
    );
  }

  Widget _buildTerm() {
    return Column(
      children: [
        Text('Syarat & Ketentuan Upload KTP', style: kNormalBoldTextStyle),
      ],
    );
  }

  Widget _buildPhoto(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      child: Container(
        height: SizeConfig.screenHeight(context) * 0.3,
        width: double.infinity,
        decoration: BoxDecoration(
          color: ColorConst.kSecondaryColor.withOpacity(0.05),
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.image,
              size: 40.0,
              color: ColorConst.kSecondaryColor.withOpacity(0.2),
            ),
            SizedBox(height: 16.0),
            Text('Pilih Foto', style: kNormalTextStyle),
          ],
        ),
      ),
    );
  }
}
