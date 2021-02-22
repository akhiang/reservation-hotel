import 'package:flutter/material.dart';
import 'package:dangau_hotel/screens/screens.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  var builder;
  switch (settings.name) {
    case SplashScreen.routeName:
      builder = (context) => SplashScreen();
      break;
    case OnBoardingScreen.routeName:
      builder = (context) => OnBoardingScreen();
      break;
    case LoginScreen.routeName:
      builder = (context) => LoginScreen();
      break;
    case MainScreen.routeName:
      builder = (context) => MainScreen();
      break;
    case MainScreen2.routeName:
      builder = (context) => MainScreen2();
      break;
    case HelpScreen.routeName:
      builder = (context) => HelpScreen();
      break;
    case EditProfileScreen.routeName:
      builder = (context) => EditProfileScreen();
      break;
    default:
      builder = (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          );
  }
  return MaterialPageRoute(builder: builder);
}
