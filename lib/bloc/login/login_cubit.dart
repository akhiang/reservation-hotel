import 'package:bloc/bloc.dart';
import 'package:dangau_hotel/models/models.dart';
import 'package:equatable/equatable.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> login(LoginRequest loginRequest) async {
    emit(LoginLoading());
    await Future.delayed(Duration(seconds: 3));
    try {
      if (loginRequest.number == '08123456' &&
          loginRequest.password == 'admin') {
        emit(LoginSuccess());
      } else {
        emit(LoginError());
      }
    } catch (e) {
      emit(LoginError());
    }
  }
}
