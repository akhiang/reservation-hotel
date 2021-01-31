part of 'package:dangau_hotel/screens/screens.dart';

class OrderTermTile extends StatelessWidget {
  final String title;

  const OrderTermTile({
    Key key,
    @required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 3.0),
            child: Icon(Icons.lens, size: 12.0),
          ),
          SizedBox(width: 24.0),
          Expanded(
              child: Text(
            title,
            style: kNormalTextStyle,
          )),
        ],
      ),
    );
  }
}
