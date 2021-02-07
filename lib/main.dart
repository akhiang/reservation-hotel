import 'package:dangau_hotel/bloc/bloc.dart';
import 'package:dangau_hotel/services/services.dart';
import 'package:dangau_hotel/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:dangau_hotel/screens/screens.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => HotelBloc(HotelService()),
        ),
        BlocProvider(
          create: (_) => HotelDetailBloc(HotelService()),
        ),
        // BlocProvider(
        //   create: (_) => OrderingCubit(),
        // ),
      ],
      child: MaterialApp(
        title: 'Hotel Reservation',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Montserrat',
          primarySwatch: ColorConst.kPrimarySwatchColor,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          appBarTheme: AppBarTheme(
            color: Colors.transparent,
            elevation: 0,
            brightness: Brightness.light,
          ),
          scaffoldBackgroundColor: ColorConst.kThirdColor,
        ),
        home: MainScreen(),
        // home: OnBoardingScreen(),
        // home: LoginScreen(),
        // initialRoute: MainScreen2.routeName,
        // onGenerateRoute: generateRoute,
      ),
    );
  }
}
