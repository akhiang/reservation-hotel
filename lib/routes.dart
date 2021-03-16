import 'package:flutter/material.dart';
import 'package:dangau_hotel/screens/screens.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  var builder;
  var args = settings.arguments;

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
    case RegisterScreen.routeName:
      builder = (context) => RegisterScreen();
      break;
    case MainScreen.routeName:
      builder = (context) => MainScreen();
      break;
    case MainScreen2.routeName:
      builder = (context) => MainScreen2();
      break;
    case MainScreen3.routeName:
      builder = (context) => MainScreen3();
      break;
    case HotelScreen.routeName:
      builder = (context) => HotelScreen(hotel: args);
      break;
    case SelectRoomScreen.routeName:
      builder = (context) => SelectRoomScreen(hotel: args);
      break;
    case RoomScreen.routeName:
      builder = (context) => RoomScreen(room: args);
      break;
    case RoomPreferenceScreen.routeName:
      builder = (context) => RoomPreferenceScreen(roomCart: args);
      break;
    case OrderRoomSummary.routeName:
      builder = (context) => OrderRoomSummary(orderResponse: args);
      break;
    case OrderCustomerContact.routeName:
      builder = (context) => OrderCustomerContact();
      break;
    case OrderTerm.routeName:
      builder = (context) => OrderTerm();
      break;
    case OrderPaymentScreen.routeName:
      builder = (context) => OrderPaymentScreen();
      break;
    case OrderSuccessScreen.routeName:
      builder = (context) => OrderSuccessScreen();
      break;
    case BookRoomDetailScreen.routeName:
      builder = (context) => BookRoomDetailScreen(booking: args);
      break;
    case HelpScreen.routeName:
      builder = (context) => HelpScreen();
      break;
    case KtpVerificationScreen.routeName:
      builder = (context) => KtpVerificationScreen();
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
