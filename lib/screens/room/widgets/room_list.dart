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
    super.initState();
    _loadHotelRoomListToCart();
  }

  void _loadHotelRoomListToCart() {
    context.read<RoomCartCubit>().getHotelRoomsToCart(widget.hotel.id);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500.0,
      child: BlocConsumer<RoomCartCubit, RoomCartState>(
        listener: (context, state) {
          if (state is RoomError) {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text('error'),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is RoomCartLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is RoomCartLoaded) {
            return ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
              itemCount: state.roomCart.length,
              itemBuilder: (_, index) {
                return RoomCard(
                  roomCart: state.roomCart[index],
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RoomPreferenceScreen(
                          roomCart: state.roomCart[index],
                        ),
                      ),
                    );
                  },
                );
              },
            );
          } else {
            return Text("off");
          }
        },
      ),
    );
  }
}
