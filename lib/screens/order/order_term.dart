part of 'package:dangau_hotel/screens/screens.dart';

class OrderTerm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildTermList(),
          SizedBox(height: 88.0),
        ],
      ),
    );
  }

  Padding _buildTermList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      child: Column(
        children: [
          OrderTermTile(title: 'Lorem Ipsum Dolor Sit Amet Adiuvat'),
          OrderTermTile(
              title: 'Lorem ipsum dolor sit amet consectetur adipiscing elit.'),
          OrderTermTile(
              title:
                  'Proin gravida senectus felis lacinia eget sed tristique.'),
          OrderTermTile(title: 'Lorem Ipsum Dolor Sit Amet Adiuvat'),
          OrderTermTile(
              title: 'Lorem ipsum dolor sit amet consectetur adipiscing elit.'),
          OrderTermTile(
              title:
                  'Proin gravida senectus felis lacinia eget sed tristique.'),
        ],
      ),
    );
  }
}
