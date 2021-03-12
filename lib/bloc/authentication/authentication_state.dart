part of 'authentication_cubit.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationUninitialized extends AuthenticationState {}

class AuthenticationAuthenticated extends AuthenticationState {
  final Guest guest;

  const AuthenticationAuthenticated({this.guest});

  AuthenticationAuthenticated copyWith({
    Guest guest,
  }) {
    return AuthenticationAuthenticated(
      guest: guest ?? this.guest,
    );
  }

  @override
  List<Object> get props => [guest];
}

class AuthenticationUnauthenticated extends AuthenticationState {}

class Authenticationloading extends AuthenticationState {}
