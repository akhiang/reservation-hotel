part of 'package:dangau_hotel/screens/screens.dart';

class UserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(88.0),
        child: CustomAppBar(title: 'Profil Saya', isLeading: true),
      ),
      body: Column(
        children: [
          ListTile(
            title: Text(
              'John doe',
              style: TextStyle(
                color: ColorConst.kSecondaryColor,
                fontWeight: FontWeight.w600,
                fontSize: 20.0,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 8.0),
                Text(
                  'johndoe@gmail.com',
                  style: TextStyle(
                    color: ColorConst.kSecondaryColor,
                  ),
                ),
                Text(
                  '+62 081232131232',
                  style: TextStyle(
                    color: ColorConst.kSecondaryColor,
                  ),
                ),
              ],
            ),
            leading: Material(
              shape: CircleBorder(),
              clipBehavior: Clip.hardEdge,
              color: ColorConst.kSecondaryColor.withOpacity(0.30),
              child: Container(
                width: 64.0,
                height: 64.0,
                child: Icon(
                  Icons.person,
                  size: 32.0,
                  color: ColorConst.kSecondaryColor,
                ),
              ),
            ),
            trailing: IconButton(
              icon: Icon(Icons.edit, color: ColorConst.kSecondaryColor),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
