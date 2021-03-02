part of 'package:dangau_hotel/screens/screens.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = 'splash_screen';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> nextRoute() async {
    bool isFirstLaunch = await AppDataPreferences.getFirstLaunch();
    if (isFirstLaunch == null) {
      Navigator.pushNamedAndRemoveUntil(
          context, OnBoardingScreen.routeName, (route) => false);
    } else {
      Navigator.pushNamedAndRemoveUntil(
          context, MainScreen3.routeName, (route) => false);
    }
  }

  void runTimer() {
    Timer(Duration(milliseconds: 1000), () {
      if (mounted) nextRoute();
    });
  }

  @override
  void initState() {
    runTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
