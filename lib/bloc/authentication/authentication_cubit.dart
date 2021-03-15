import 'package:bloc/bloc.dart';
import 'package:dangau_hotel/models/models.dart';
import 'package:dangau_hotel/utils/auth_preferences.dart';
import 'package:equatable/equatable.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationUninitialized());

  Future<void> loggedIn(LoginResponse loginResponse) async {
    AuthPreferences.setUserData(loginResponse.guest);
    AuthPreferences.setToken(loginResponse.accessToken);
    emit(AuthenticationAuthenticated(
        guest: loginResponse.guest, token: loginResponse.accessToken));
  }

  Future<void> loggedOut() async {
    await AuthPreferences.removeToken();
    await AuthPreferences.removeUserData();
    emit(AuthenticationUnauthenticated());
  }

  Future<void> checkUserData() async {
    bool isHasToken = await AuthPreferences.hasToken();
    bool isHasUserData = await AuthPreferences.hasUserData();

    if (isHasUserData && isHasToken) {
      Guest guest = await AuthPreferences.getUserData();
      String token = await AuthPreferences.getToken();
      emit(AuthenticationAuthenticated(guest: guest, token: token));
    } else {
      loggedOut();
    }
  }
}
