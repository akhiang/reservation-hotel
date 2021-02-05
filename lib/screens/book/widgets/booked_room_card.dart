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

class ExpandedSection extends StatefulWidget {
  final Widget child;
  final bool expand;
  ExpandedSection({this.expand = false, this.child});

  @override
  _ExpandedSectionState createState() => _ExpandedSectionState();
}

class _ExpandedSectionState extends State<ExpandedSection>
    with SingleTickerProviderStateMixin {
  AnimationController expandController;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    prepareAnimations();
  }

  ///Setting up the animation
  void prepareAnimations() {
    expandController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 100));
    Animation curve = CurvedAnimation(
      parent: expandController,
      curve: Curves.fastOutSlowIn,
    );
    animation = Tween(begin: 0.0, end: 1.0).animate(curve)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void didUpdateWidget(ExpandedSection oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.expand) {
      expandController.forward();
    } else {
      expandController.reverse();
    }
  }

  @override
  void dispose() {
    expandController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
        axisAlignment: 1.0, sizeFactor: animation, child: widget.child);
  }
}
