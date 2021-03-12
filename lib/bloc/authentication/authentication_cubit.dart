import 'package:bloc/bloc.dart';
import 'package:dangau_hotel/models/models.dart';
import 'package:dangau_hotel/repository/user_repository.dart';
import 'package:equatable/equatable.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  final UserRepository userRepository;

  AuthenticationCubit({this.userRepository})
      : super(AuthenticationUninitialized());

  Future<void> loggedIn(LoginResponse loginResponse) async {
    emit(AuthenticationAuthenticated(guest: loginResponse.guest));
  }

  Future<void> loggedOut() async {
    emit(AuthenticationUnauthenticated());
  }
}
