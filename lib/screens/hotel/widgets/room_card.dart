part of 'package:dangau_hotel/screens/screens.dart';

class RoomCard extends StatelessWidget {
  final RoomCart roomCart;
  final Function press;

  const RoomCard({
    Key key,
    @required this.roomCart,
    @required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => RoomScreen(room: roomCart.room),
          ),
        );
      },
      child: Container(
        height: 128.0,
        width: double.infinity,
        margin: EdgeInsets.symmetric(vertical: 8.0),
        padding: EdgeInsets.all(12.0),
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(16.0)),
              child: SizedBox(
                width: 88.0,
                child: AspectRatio(
                  aspectRatio: 0.5,
                  child: Image.network(
                    '${roomCart.room.imageUrl}',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(width: 8.0),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: '${roomCart.room.name}'.titleCase,
                              style: kNormalBoldTextStyle,
                            ),
                            TextSpan(
                              text: ' ',
                            ),
                            TextSpan(
                              text: '${roomCart.room.variant}'.titleCase,
                              style: kSmallTextStyle,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 4.0),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          roomCart.room.available > 0
                              ? Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SvgPicture.asset(
                                      kRoomAvailableIcon,
                                      height: 16.0,
                                      width: 16.0,
                                      color: ColorConst.kErrorColor,
                                    ),
                                    SizedBox(width: 4.0),
                                    Text(
                                      "${roomCart.room.available}",
                                      style: kNormalBoldTextStyle,
                                    ),
                                  ],
                                )
                              : SizedBox(),
                          SizedBox(width: 8.0),
                          SvgPicture.asset(
                            kPeopleIcon,
                            height: 16.0,
                            width: 16.0,
                            color: ColorConst.kErrorColor,
                          ),
                          SizedBox(width: 4.0),
                          Text(
                            "${roomCart.room.guest}",
                            style: kNormalBoldTextStyle,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      roomCart.room.available > 0
                          ? RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: NumberFormat.currency(
                                            locale: 'id',
                                            symbol: 'Rp',
                                            decimalDigits: 0)
                                        .format(roomCart.room.price),
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      color: ColorConst.kErrorColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13.0,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "\n/malam",
                                    style: kSmallTextStyle,
                                  ),
                                ],
                              ),
                            )
                          : Text('Kamar tidak\ntersedia',
                              style: kSmallBoldTextStyle),
                      roomCart.room.available > 0
                          ? roomCart.quantity > 0
                              ? _buildRoomCardQuantity(context)
                              : SizedBox(
                                  height: 32.0,
                                  child: PrimaryButton(
                                    text: 'Pilih',
                                    press: press,
                                  ),
                                )
                          : Icon(
                              Icons.no_meeting_room,
                              size: 32.0,
                              color: ColorConst.kErrorColor,
                            )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRoomCardQuantity(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RoundedIconBtn(
              icon: Icons.remove_rounded,
              color: ColorConst.kSecondaryColor,
              press: () {
                context
                    .read<RoomCartCubit>()
                    .decrementRoomCartQuantity(roomCart.id);
              },
            ),
            SizedBox(width: 16.0),
            SizedBox(
              width: 32.0,
              child: Text(
                '${roomCart.quantity}',
                textAlign: TextAlign.center,
                style: kNormalBoldTextStyle,
              ),
            ),
            SizedBox(width: 16.0),
            RoundedIconBtn(
              icon: Icons.add_rounded,
              color: roomCart.quantity >= roomCart.room.available
                  ? ColorConst.kSecondaryColor.withOpacity(0.4)
                  : ColorConst.kSecondaryColor,
              press: roomCart.quantity >= roomCart.room.available
                  ? () {}
                  : () {
                      context
                          .read<RoomCartCubit>()
                          .incrementRoomCartQuantity(roomCart.id);
                    },
            ),
          ],
        ),
        SizedBox(height: 12.0),
        GestureDetector(
          onTap: press,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              'Edit Preferensi',
              style: TextStyle(
                fontSize: 12.0,
                color: ColorConst.kErrorColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        )
      ],
    );
  }
}
