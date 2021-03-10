part of 'package:dangau_hotel/screens/screens.dart';

class RoomScreen extends StatefulWidget {
  static const String routeName = "room_screen";

  final Room room;

  const RoomScreen({
    Key key,
    @required this.room,
  }) : super(key: key);

  @override
  _RoomScreenState createState() => _RoomScreenState();
}

class _RoomScreenState extends State<RoomScreen> {
  void _loadRoomDetail() {
    context.read<RoomDetailCubit>().getRoomDetail(widget.room.id);
  }

  @override
  void initState() {
    super.initState();
    _loadRoomDetail();
  }

  @override
  Widget build(BuildContext context) {
    final List<int> list = [1, 2, 3, 4, 5];
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocBuilder<RoomDetailCubit, RoomDetailState>(
          builder: (context, state) {
            if (state is RoomDetailLoading) {
              return RoomShimmer();
            } else if (state is RoomDetailLoaded) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildRoomImageCarousel(list, context),
                  _buildRoomDetail(),
                  _buildFacility(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Divider(
                      color: ColorConst.kSecondaryColor.withOpacity(0.5),
                    ),
                  ),
                  _buildDescription(),
                ],
              );
            }
            return Error(press: () {
              _loadRoomDetail();
            });
          },
        ),
      ),
    );
  }

  Widget _buildRoomImageCarousel(List<int> list, BuildContext context) {
    return Stack(
      children: [
        HomeCarousel(
          list: list,
          height: 0.4,
          autoPlay: false,
        ),
        IconButton(
          padding: EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 64.0,
          ),
          icon: Icon(
            Icons.chevron_left,
            size: 32.0,
            color: ColorConst.kThirdColor,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }

  Widget _buildRoomDetail() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '${widget.room.name}'.titleCase,
                      style: kLargeBoldTextStyle,
                    ),
                    TextSpan(
                      text: "\n${widget.room.variant}".titleCase,
                      style: TextStyle(
                        color: ColorConst.kSecondaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              RichText(
                textAlign: TextAlign.right,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: Helper.priceFormat(widget.room.price.toDouble()),
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: ColorConst.kErrorColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 18.0,
                      ),
                    ),
                    TextSpan(
                      text: "\n/malam",
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: ColorConst.kSecondaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Icon(
                  //   FontAwesomeIcons.doorOpen,
                  //   color: ColorConst.kErrorColor,
                  // ),
                  // SizedBox(width: 8.0),
                  // Text(
                  //   "${widget.room.available}",
                  //   style: TextStyle(
                  //     color: ColorConst.kSecondaryColor,
                  //     fontWeight: FontWeight.w600,
                  //   ),
                  // ),
                  // SizedBox(width: 8.0),
                  Icon(
                    Icons.people,
                    color: ColorConst.kErrorColor,
                  ),
                  SizedBox(width: 8.0),
                  Text(
                    "${widget.room.personCapacity}",
                    style: TextStyle(
                      color: ColorConst.kSecondaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Text(
                "Belum termasuk PPN 10%",
                style: TextStyle(
                  color: ColorConst.kSecondaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFacility() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Fasilitas',
            style: kNormalBoldTextStyle,
          ),
          SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FacilityCard(
                  icon: Icons.king_bed_rounded,
                  title: '1 King Bed',
                  size: 32.0),
              FacilityCard(icon: Icons.people, title: '2 Tamu', size: 32.0),
              FacilityCard(icon: Icons.restaurant, title: 'Sarapan'),
              FacilityCard(icon: FontAwesomeIcons.thLarge, title: 'Lainnya'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDescription() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
      child: Text(
        '${widget.room.description}',
        style: TextStyle(
          color: ColorConst.kSecondaryColor,
          height: 1.4,
        ),
        textAlign: TextAlign.justify,
      ),
    );
  }
}
