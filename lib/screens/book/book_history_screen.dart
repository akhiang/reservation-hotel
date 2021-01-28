part of 'package:dangau_hotel/screens/screens.dart';

class BookHistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          BookedRoomCard(),
          BookedRoomCard(),
          SizedBox(height: 96.0),
        ],
      ),
    );
  }
}
