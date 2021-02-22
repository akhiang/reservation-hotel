// part of 'package:dangau_hotel/screens/screens.dart';
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
      print('main screen');
      builder = (context) => MainScreen();
      break;
    case MainScreen2.routeName:
      print('main screen 2');
      builder = (context) => MainScreen2();
      break;
    case HelpScreen.routeName:
      print('asd');
      builder = (context) => HelpScreen();
      break;
    case EditProfileScreen.routeName:
      print('edit profile');
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
