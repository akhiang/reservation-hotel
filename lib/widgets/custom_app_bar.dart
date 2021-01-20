part of 'package:dangau_hotel/screens/screens.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final bool isLeading;

  const CustomAppBar({
    Key key,
    @required this.title,
    this.isLeading = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      flexibleSpace: Container(
        color: Colors.red,
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                isLeading
                    ? IconButton(
                        icon: Icon(
                          Icons.chevron_left,
                          color: ColorConst.kSecondaryColor,
                          size: 32.0,
                        ),
                        padding: EdgeInsets.all(0.0),
                        
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      )
                    : SizedBox(width: 40.0, height: 40.0),
                Text(
                  title,
                  style: TextStyle(
                      color: ColorConst.kSecondaryColor,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600),
                ),
                isLeading
                    ? SizedBox(width: 40.0)
                    : SizedBox(width: 40.0, height: 40.0),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
