part of 'package:dangau_hotel/screens/screens.dart';

class HotelContactListTile extends StatelessWidget {
  final IconData icon;
  final String text;

  const HotelContactListTile({
    Key key,
    @required this.icon,
    @required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: 16.0,
            color: ColorConst.kErrorColor,
          ),
          SizedBox(width: 8.0),
          Expanded(
            child: Text(
              text,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          )
        ],
      ),
    );
  }
}
