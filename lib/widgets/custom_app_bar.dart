part of 'package:dangau_hotel/screens/screens.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      flexibleSpace: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.chevron_left,
                    color: ColorConst.kSecondaryColor,
                    size: 40.0,
                  ),
                  padding: EdgeInsets.all(0.0),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Text(
                  'Hotel Yang Tersedia',
                  style: TextStyle(
                      color: ColorConst.kSecondaryColor,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(width: 40.0),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
