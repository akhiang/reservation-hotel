part of 'package:dangau_hotel/screens/screens.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = "login_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeroImage(
              height: 0.40,
              imageUrl: 'assets/images/pexels-thorsten-technoman-338504.jpg',
            ),
            _buildLoginForm(),
            Text('Atau login dengan', style: kNormalBoldTextStyle),
            _buildSocialMediaCard(),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Butuh akun?',
                      style: kNormalTextStyle,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => RegisterScreen(),
                          ),
                        );
                      },
                      child: Text(
                        " Daftar Disini",
                        style: kNormalBoldTextStyle,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Lupa Password?',
                      style: kNormalTextStyle,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        " Tekan Disini",
                        style: kNormalBoldTextStyle,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialMediaCard() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        children: [
          Flexible(
            flex: 1,
            child: SocialMediaLoginCard(
              title: 'Google',
              icon: FontAwesomeIcons.google,
            ),
          ),
          SizedBox(width: 24.0),
          Flexible(
            flex: 1,
            child: SocialMediaLoginCard(
              title: 'Facebook',
              icon: FontAwesomeIcons.facebookF,
              color: Color(0xFF395185),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildLoginForm() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Login',
            style: kLargeBoldTextStyle,
          ),
          SizedBox(height: 8.0),
          RoundedInputField(
            hint: "Nomor Telepon",
            onChanged: (value) {},
          ),
          RoundedInputField(
            hint: "Password",
            onChanged: (value) {},
          ),
          SizedBox(height: 8.0),
          Center(
            child: SizedBox(
              height: 48.0,
              width: 136.0,
              child: PrimaryButton(
                text: 'Login',
                press: () {},
              ),
            ),
          )
        ],
      ),
    );
  }
}
