import 'package:bloc/bloc.dart';
import 'package:dangau_hotel/models/models.dart';
import 'package:dangau_hotel/services/services.dart';
import 'package:equatable/equatable.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthService _authService;

  LoginCubit(this._authService) : super(LoginInitial());

  Future<void> login(LoginRequest loginRequest) async {
    emit(LoginLoading());
    await Future.delayed(Duration(seconds: 1));
    try {
      LoginResponse loginResponse = await _authService.login(loginRequest);
      emit(LoginSuccess(loginResponse: loginResponse));
    } catch (error) {
      print('ccatc');
      emit(LoginError());
    }
  }
}
