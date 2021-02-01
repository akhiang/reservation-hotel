part of 'package:dangau_hotel/screens/screens.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(88.0),
        child: CustomAppBar(title: 'Daftar', isLeading: true),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 104.0),
        height: 80.0,
        child: PrimaryButton(
          text: 'Lanjutkan',
          press: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => OtpScreen(),
              ),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            children: [
              SelectedRoomCard(
                title: 'johndoe@gmail.com',
              ),
              SelectedRoomCard(
                title: 'John Doe',
              ),
              RoundedInputField(
                hint: "Alamat",
                onChanged: (value) {},
              ),
              RoundedInputField(
                hint: "Nomor Telepon",
                onChanged: (value) {},
              ),
              RoundedInputField(
                hint: "Kata Sandi",
                onChanged: (value) {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
