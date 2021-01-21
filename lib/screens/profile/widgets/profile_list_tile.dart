part of 'package:dangau_hotel/screens/screens.dart';

class ProfileListTile extends StatelessWidget {
  const ProfileListTile({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
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
          onPressed: () {
            Navigator.of(context, rootNavigator: true).push(
              MaterialPageRoute(
                builder: (context) => EditProfileScreen(),
              ),
            );
          },
        ),
      ),
    );
  }
}
