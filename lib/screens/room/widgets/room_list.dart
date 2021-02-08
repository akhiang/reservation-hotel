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
    _loadHotelRoomList();
  }

  void _loadHotelRoomList() {
    context.read<RoomCubit>().getHotelRooms(widget.hotel.id);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500.0,
      child: BlocConsumer<RoomCubit, RoomState>(
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
          if (state is RoomLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is RoomLoaded) {
            return ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
              itemCount: state.rooms.length,
              itemBuilder: (_, index) {
                return RoomCard(
                  room: state.rooms[index],
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RoomPreferenceScreen(),
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
