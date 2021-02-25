part of 'package:dangau_hotel/screens/screens.dart';

class EditProfileScreen extends StatefulWidget {
  static const String routeName = "edit_profile_screen";

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> with Validation {
  final _formKey = GlobalKey<FormState>();

  void _editProfileSubmit() {
    // String _mobileNumber = _mobileNumberController.text;
    // String _password = _passwordController.text;
    if (_formKey.currentState.validate()) {
      // context.read<LoginCubit>().login(LoginRequest(
      //       number: _mobileNumber,
      //       password: _password,
      //     ));
    }
  }

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
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InputField(
                              validation: validateName,
                              hint: "Nama Lengkap",
                              onChanged: (value) {},
                            ),
                            InputField(
                              validation: validateEmail,
                              hint: "Email",
                              onChanged: (value) {},
                            ),
                            InputField(
                              validation: validatePhoneNumber,
                              hint: "Nomor Telepon",
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
                            InputField(
                              hint: "Password Lama",
                              onChanged: (value) {},
                            ),
                            InputField(
                              hint: "Password Baru",
                              onChanged: (value) {},
                            ),
                            SizedBox(height: 16.0),
                            Center(
                              child: SizedBox(
                                height: 48.0,
                                width: 120.0,
                                child: PrimaryButton(
                                  text: 'Simpan',
                                  press: () {
                                    _editProfileSubmit();
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
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
