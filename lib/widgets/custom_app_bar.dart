part of 'package:dangau_hotel/widgets/widgets.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final bool isLeading;
  final Function press;

  const CustomAppBar({
    Key key,
    @required this.title,
    this.isLeading = true,
    this.press,
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
                      // onPressed: () {
                      //   Navigator.pop(context);
                      // },
                      onPressed: press == null
                          ? () {
                              Navigator.pop(context);
                            }
                          : press,
                      icon: Icon(
                        Icons.chevron_left,
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
                style: kLargeBoldTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
