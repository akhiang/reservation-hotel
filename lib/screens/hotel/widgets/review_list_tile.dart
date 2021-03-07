part of 'package:dangau_hotel/screens/screens.dart';

class ReviewListTile extends StatefulWidget {
  final HotelReview review;

  const ReviewListTile({Key key, @required this.review}) : super(key: key);

  @override
  _ReviewListTileState createState() => _ReviewListTileState();
}

class _ReviewListTileState extends State<ReviewListTile> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 24.0,
                backgroundImage:
                    NetworkImage('https://reqres.in/img/faces/7-image.jpg'),
              ),
              SizedBox(width: 12.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${widget.review.userId}',
                    style: TextStyle(
                      color: ColorConst.kSecondaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 18.0,
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    '${Helper.dateParser(widget.review.createdAt)}',
                    style: TextStyle(
                      color: ColorConst.kSecondaryColor.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 8.0),
          Text('⭐⭐⭐⭐⭐'),
          SizedBox(height: 8.0),
          GestureDetector(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            child: Text(
              '${widget.review.comment}',
              style: TextStyle(
                color: ColorConst.kSecondaryColor,
                height: 1.4,
              ),
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              maxLines: _isExpanded ? 10 : 2,
            ),
          ),
        ],
      ),
    );
  }
}
