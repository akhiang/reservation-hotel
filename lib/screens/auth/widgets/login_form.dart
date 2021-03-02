part of 'package:dangau_hotel/screens/screens.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> with Validation {
  final _formKey = GlobalKey<FormState>();
  final _mobileNumberController = TextEditingController();
  final _passwordController = TextEditingController();

  void _loginSubmit() {
    String _mobileNumber = _mobileNumberController.text;
    String _password = _passwordController.text;
    if (_formKey.currentState.validate()) {
      context.read<LoginCubit>().login(LoginRequest(
            number: _mobileNumber,
            password: _password,
          ));
    }
  }

  @override
  void dispose() {
    _mobileNumberController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginError) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text('Login failed'),
            ),
          );
        }
      },
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Login', style: kLargeBoldTextStyle),
            SizedBox(height: 8.0),
            InputField(
              hint: "Nomor Telepon",
              controller: _mobileNumberController,
              validation: validatePhoneNumberLogin,
              onChanged: (value) {},
            ),
            InputField(
              hint: "Password",
              controller: _passwordController,
              validation: validatePasswordLogin,
              onChanged: (value) {},
            ),
            SizedBox(height: 8.0),
            Center(
              child: SizedBox(
                height: 48.0,
                width: 136.0,
                child: PrimaryButton(
                  text: 'Login',
                  press: () {
                    _loginSubmit();
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}