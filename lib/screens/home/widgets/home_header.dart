part of 'package:dangau_hotel/screens/screens.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 48.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Guest',
                style: TextStyle(
                  color: ColorConst.kSecondaryColor,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.2,
                ),
              ),
              SizedBox(height: 4.0),
              Text(
                'Belum Verifikasi',
                style: TextStyle(
                  color: ColorConst.kSecondaryColor,
                  letterSpacing: 1.2,
                ),
              ),
            ],
          ),
          RawMaterialButton(
            onPressed: () {
              Navigator.of(context, rootNavigator: true).push(
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ),
              );
            },
            constraints: BoxConstraints(),
            elevation: 0.0,
            fillColor: ColorConst.kSecondaryColor.withOpacity(0.30),
            child: Icon(
              Icons.person,
              size: 24.0,
            ),
            padding: EdgeInsets.all(8.0),
            shape: CircleBorder(),
          ),
        ],
      ),
    );
  }
}
