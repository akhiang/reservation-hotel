import 'package:dangau_hotel/bloc/bloc.dart';
import 'package:dangau_hotel/services/services.dart';
import 'package:dangau_hotel/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:dangau_hotel/routes.dart';
import 'package:dangau_hotel/screens/screens.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => LoginCubit()),
        BlocProvider(create: (_) => DateCubit()),
        BlocProvider(create: (_) => OrderCheckoutTimerBloc(ticker: Ticker())),
        BlocProvider(create: (_) => HotelBloc(HotelService())),
        BlocProvider(create: (_) => HotelDetailBloc(HotelService())),
        BlocProvider(create: (_) => RoomCartCubit(RoomService())),
        BlocProvider(create: (_) => PaymentMethodCubit(PaymentMethodService())),
        BlocProvider(create: (_) => OrderingStatusCubit()),
        BlocProvider(create: (_) => OrderCartCubit()),
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
        // home: SplashScreen(),
        // home: OnBoardingScreen(),
        // home: LoginScreen(),
        initialRoute: SplashScreen.routeName,
        onGenerateRoute: generateRoute,
      ),
    );
  }
}
