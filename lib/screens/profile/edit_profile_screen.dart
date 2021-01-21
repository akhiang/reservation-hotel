part of 'package:dangau_hotel/screens/screens.dart';

class EditProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(88.0),
        child: CustomAppBar(title: 'Ubah Profil', isLeading: true),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Material(
                        shape: CircleBorder(),
                        clipBehavior: Clip.hardEdge,
                        color: ColorConst.kSecondaryColor.withOpacity(0.30),
                        child: Container(
                          width: 64.0,
                          height: 64.0,
                          child: Icon(
                            Icons.person,
                            size: 32.0,
                            color: ColorConst.kSecondaryColor,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Pilih Foto',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: ColorConst.kSecondaryColor,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32.0, vertical: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RoundedInputField(
                            hint: "Nama Lengkap",
                            onChanged: (value) {},
                          ),
                          RoundedInputField(
                            hint: "Email",
                            onChanged: (value) {},
                          ),
                          RoundedInputField(
                            hint: "Nomor HP",
                            onChanged: (value) {},
                          ),
                          SizedBox(height: 16.0),
                          Text(
                            'Ubah Password',
                            style: TextStyle(
                              color: ColorConst.kSecondaryColor,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 8.0),
                          RoundedInputField(
                            hint: "Password Lama",
                            onChanged: (value) {},
                          ),
                          RoundedInputField(
                            hint: "Password Baru",
                            onChanged: (value) {},
                          ),
                          SizedBox(height: 16.0),
                          Center(
                            child: SizedBox(
                              height: 40.0,
                              width: 120.0,
                              child: PrimaryButton(
                                text: 'Simpan',
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
