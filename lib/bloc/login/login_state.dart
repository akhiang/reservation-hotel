part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final LoginResponse loginResponse;

  const LoginSuccess({this.loginResponse});

  LoginSuccess copyWith({
    LoginResponse loginResponse,
  }) {
    return LoginSuccess(
      loginResponse: loginResponse ?? this.loginResponse,
    );
  }

  @override
  List<Object> get props => [loginResponse];
}

class LoginError extends LoginState {}
