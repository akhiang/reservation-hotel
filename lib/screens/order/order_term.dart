part of 'package:dangau_hotel/screens/screens.dart';

class OrderTerm extends StatefulWidget {
  @override
  _OrderTermState createState() => _OrderTermState();
}

class _OrderTermState extends State<OrderTerm> {
  bool _checkboxListTile = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(88.0),
        child: CustomAppBar(title: 'Syarat & Ketentuan', isLeading: true),
      ),
      extendBody: true,
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 104.0),
        height: 80.0,
        child: PrimaryButton(
          text: 'Selesai',
          press: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => OrderTerm()),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildTermList(),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  CircularCheckBox(
                    value: _checkboxListTile,
                    disabledColor: Colors.grey,
                    onChanged: (value) => this.setState(() {
                      _checkboxListTile = !_checkboxListTile;
                    }),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() {
                        _checkboxListTile = !_checkboxListTile;
                      }),
                      child: Container(
                        color: ColorConst.kThirdColor,
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                            'Saya Setuju dengan Syarat & Ketentuan yang berlaku',
                            style: kNormalBoldTextStyle),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 88.0),
          ],
        ),
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
