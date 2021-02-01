part of 'package:dangau_hotel/screens/screens.dart';

class OtpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(88.0),
        child: CustomAppBar(title: 'Verfikasi', isLeading: true),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Kode OTP',
                  textAlign: TextAlign.center, style: kExtraLargeBoldTextStyle),
              SizedBox(height: 24.0),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Masukkan kode OTP \nyang dikirimkan ke \nnomor ",
                      style: kNormalTextStyle,
                    ),
                    TextSpan(
                      text: "+62 819 *** *** 80",
                      style: kNormalBoldTextStyle,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.0),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Tekan di sini",
                      style: kNormalBoldTextStyle,
                    ),
                    TextSpan(
                      text: " jika anda belum menerima \nkode OTP (60 d)",
                      style: kNormalTextStyle,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OtpInputField(
                    onChanged: (value) {},
                  ),
                  OtpInputField(
                    onChanged: (value) {},
                  ),
                  OtpInputField(
                    onChanged: (value) {},
                  ),
                  OtpInputField(
                    onChanged: (value) {},
                  ),
                  OtpInputField(
                    onChanged: (value) {},
                  ),
                  OtpInputField(
                    onChanged: (value) {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
