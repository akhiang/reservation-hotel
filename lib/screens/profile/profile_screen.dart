part of 'package:dangau_hotel/screens/screens.dart';

class ProfileScreen extends StatelessWidget {
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
                    title: 'Kartu Saya',
                  ),
                  RoundedCard(
                    icon: Icons.help,
                    title: 'Bantuan',
                    press: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => HelpScreen(),
                        ),
                      );
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
                    title: 'Keluar dari aplikasi?',
                    description: '',
                    firstButtonText: 'Tidak',
                    secondButtonText: 'Keluar',
                    firstButtonPress: () {
                      Navigator.of(context).pop();
                    },
                    secondButtonPress: () {
                      Future.delayed(const Duration(milliseconds: 1000), () {
                        SystemChannels.platform
                            .invokeMethod('SystemNavigator.pop');
                      });
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
