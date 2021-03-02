part of 'package:dangau_hotel/screens/screens.dart';

class ProfileScreen extends StatelessWidget {
  static const String routeName = "profile_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(88.0),
        child: CustomAppBar(title: 'Profil Saya', isLeading: false),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProfileListTile(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  RoundedCard(
                    icon: Icons.credit_card,
                    title: 'Vertifikasi KTP',
                    press: () {
                      Navigator.pushNamed(
                          context, KtpVerificationScreen.routeName);
                    },
                  ),
                  RoundedCard(
                    icon: Icons.help,
                    title: 'Bantuan',
                    press: () {
                      Navigator.pushNamed(context, HelpScreen.routeName);
                    },
                  ),
                  RoundedCard(
                    icon: Icons.star,
                    title: 'Rating',
                  ),
                ],
              ),
            ),
            FlatButton(
              onPressed: () async {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => CustomDialog(
                    icon: Icons.help_rounded,
                    title: 'Keluar dari akun?',
                    firstButtonText: 'Tidak',
                    secondButtonText: 'Keluar',
                    firstButtonPress: () => Navigator.of(context).pop(),
                    secondButtonPress: () {
                      Navigator.of(context).pop();
                    },
                  ),
                );
              },
              child: Text(
                'Keluar',
                style: TextStyle(
                  color: ColorConst.kSecondaryColor,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24.0),
              ),
            )
          ],
        ),
      ),
    );
  }
}
