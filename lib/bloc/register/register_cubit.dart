import 'package:bloc/bloc.dart';
import 'package:dangau_hotel/models/models.dart';
import 'package:equatable/equatable.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  Future<void> register(RegisterRequest registerRequest) async {
    emit(RegisterLoading());
    await Future.delayed(Duration(seconds: 3));
    try {
      if (registerRequest.number == '08123456' &&
          registerRequest.password == 'admin') {
        emit(RegisterSuccess());
      } else {
        emit(RegisterError());
      }
    } catch (e) {
      emit(RegisterError());
    }
  }
}
