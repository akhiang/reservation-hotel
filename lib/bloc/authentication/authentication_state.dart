part of 'authentication_cubit.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationUninitialized extends AuthenticationState {}

class AuthenticationAuthenticated extends AuthenticationState {
  final Guest guest;
  final String token;

  const AuthenticationAuthenticated({this.guest, this.token});

  AuthenticationAuthenticated copyWith({
    Guest guest,
    String token,
  }) {
    return AuthenticationAuthenticated(
      guest: guest ?? this.guest,
      token: token ?? this.token,
    );
  }

  @override
  List<Object> get props => [guest, token];
}

class AuthenticationUnauthenticated extends AuthenticationState {}

class Authenticationloading extends AuthenticationState {}
