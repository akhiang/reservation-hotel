part of 'package:dangau_hotel/screens/screens.dart';

class ProfileListTile extends StatelessWidget {
  const ProfileListTile({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthenticationState authenticationState =
        context.watch<AuthenticationCubit>().state;
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(
          (authenticationState is AuthenticationAuthenticated)
              ? authenticationState.guest.name
              : 'Guest',
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
              (authenticationState is AuthenticationAuthenticated)
                  ? authenticationState.guest.email
                  : 'guest@email.com',
              style: TextStyle(
                color: ColorConst.kSecondaryColor,
              ),
            ),
            Text(
              (authenticationState is AuthenticationAuthenticated)
                  ? authenticationState.guest.phone
                  : '',
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
            width: 80.0,
            height: 80.0,
            child: Icon(
              Icons.person,
              size: 32.0,
              color: ColorConst.kSecondaryColor,
            ),
          ),
        ),
        trailing: (authenticationState is AuthenticationAuthenticated)
            ? IconButton(
                icon: Icon(Icons.edit, color: ColorConst.kSecondaryColor),
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).push(
                    MaterialPageRoute(
                      builder: (context) => EditProfileScreen(),
                    ),
                  );
                },
              )
            : SizedBox(),
      ),
    );
  }
}
