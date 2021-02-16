part of 'package:dangau_hotel/screens/screens.dart';

class BookedRoomCard extends StatefulWidget {
  const BookedRoomCard({
    Key key,
  }) : super(key: key);

  @override
  _BookedRoomCardState createState() => _BookedRoomCardState();
}

class _BookedRoomCardState extends State<BookedRoomCard> {
  bool _isExpanded = false;

  void _toogleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: ColorConst.kThirdColor,
              borderRadius: BorderRadius.circular(16.0),
              boxShadow: [
                BoxShadow(
                  color: ColorConst.kSecondaryColor.withOpacity(0.15),
                  offset: Offset(0.0, 5.0),
                  blurRadius: 20.0,
                ),
              ],
            ),
            child: Column(
              children: [
                BookedRoomTile(),
                ExpandedSection(
                  expand: _isExpanded,
                  child: BookedRoomDetail(),
                ),
                InkWell(
                  onTap: _toogleExpand,
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      _isExpanded ? 'TUTUP' : 'LIHAT DETAIL',
                      style: kNormalBoldTextStyle,
                    ),
                  ),
                ),
                SizedBox(height: 8.0),
              ],
            ),
          )
        ],
      ),
    );
  }
}
