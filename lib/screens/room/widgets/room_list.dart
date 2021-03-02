part of 'package:dangau_hotel/screens/screens.dart';

class RoomList extends StatefulWidget {
  final Hotel hotel;

  const RoomList({Key key, this.hotel}) : super(key: key);

  @override
  _RoomListState createState() => _RoomListState();
}

class _RoomListState extends State<RoomList> {
  @override
  void initState() {
    _loadHotelRoomListToCart();
    super.initState();
  }

  void _loadHotelRoomListToCart() {
    context.read<RoomCartCubit>().getHotelRoomsToCart(widget.hotel.id);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500.0,
      child: BlocBuilder<RoomCartCubit, RoomCartState>(
        builder: (context, state) {
          if (state is RoomCartLoading) {
            return RoomListShimmer();
          } else if (state is RoomCartLoaded) {
            return ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
              itemCount: state.roomCart.length,
              itemBuilder: (_, index) {
                return RoomCard(
                  roomCart: state.roomCart[index],
                  press: () {
                    Navigator.pushNamed(context, RoomPreferenceScreen.routeName,
                        arguments: state.roomCart[index]);
                  },
                );
              },
            );
          } else if (state is RoomCartError) {
            return Error(press: () {
              _loadHotelRoomListToCart();
            });
          } else {
            return Error(press: () {
              _loadHotelRoomListToCart();
            });
          }
        },
      ),
    );
  }
}
