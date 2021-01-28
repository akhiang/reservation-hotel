part of 'package:dangau_hotel/screens/screens.dart';

class BookIncomingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          BookedRoomCard(),
        ],
      ),
    );
  }
}
