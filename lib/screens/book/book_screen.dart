part of 'package:dangau_hotel/screens/screens.dart';

class BookScreen extends StatefulWidget {
  @override
  _BookScreenState createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(88.0),
        child: CustomAppBar(title: 'Pesanan Saya', isLeading: false),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BookedRoomCard(),
            // BookedRoomCard(),
          ],
        ),
      ),
    );
  }
}
