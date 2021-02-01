import 'package:dangau_hotel/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:dangau_hotel/screens/screens.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: ColorConst.kPrimarySwatchColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: AppBarTheme(
          color: Colors.transparent,
          elevation: 0,
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: ColorConst.kThirdColor,
      ),
      home: OnBoardingScreen(),
      // home: LoginScreen(),
      // onGenerateRoute: Router,
      // initialRoute: homeRoute,
    );
  }
}
