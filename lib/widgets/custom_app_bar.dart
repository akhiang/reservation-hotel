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
        padding: EdgeInsets.all(16.0),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            isLeading
                ? Align(
                    alignment: Alignment.bottomLeft,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.chevron_left_rounded,
                        color: ColorConst.kSecondaryColor,
                      ),
                      iconSize: 32.0,
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints(),
                    ),
                  )
                : SizedBox(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                title,
                style: TextStyle(
                  color: ColorConst.kSecondaryColor,
                  fontSize: 25.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
