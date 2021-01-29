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
        clipBehavior: Clip.hardEdge,
        child: Column(
          children: [
            ProfileListTile(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
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
                    title: 'Berikan nilai untuk aplikasi ini',
                  ),
                ],
              ),
            ),
            FlatButton(
              onPressed: () {},
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
