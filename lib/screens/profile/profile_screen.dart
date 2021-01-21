part of 'package:dangau_hotel/screens/screens.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(88.0),
        child: CustomAppBar(title: 'Profil Saya', isLeading: false),
      ),
      body: Column(
        children: [
          ProfileListTile(),
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
            icon: Icons.star_rounded,
            title: 'Berikan nilai untuk aplikasi ini',
          ),
        ],
      ),
    );
  }
}
