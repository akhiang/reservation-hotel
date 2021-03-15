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
        BlocProvider(create: (_) => AuthenticationCubit()),
        BlocProvider(create: (_) => LoginCubit(AuthService())),
        BlocProvider(create: (_) => RegisterCubit()),
        BlocProvider(create: (_) => DateCubit()),
        BlocProvider(create: (_) => OrderCubit(BookingService())),
        BlocProvider(create: (_) => OrderCheckoutTimerBloc(ticker: Ticker())),
        BlocProvider(create: (_) => HotelBloc(HotelService())),
        BlocProvider(create: (_) => HotelDetailBloc(HotelService())),
        BlocProvider(create: (_) => RoomCartCubit(RoomService())),
        BlocProvider(create: (_) => RoomDetailCubit(RoomService())),
        BlocProvider(create: (_) => PaymentMethodCubit(PaymentMethodService())),
        BlocProvider(create: (_) => BookedCubit(BookingService())),
        BlocProvider(create: (_) => BookedDetailCubit(BookingService())),
      ],
      child: MaterialApp(
        title: 'Kahyangan Group',
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
        initialRoute: SplashScreen.routeName,
        onGenerateRoute: generateRoute,
      ),
    );
  }
}
