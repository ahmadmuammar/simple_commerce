part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoadInProgress extends AuthState {}

class AuthLoginSuccess extends AuthState {
  const AuthLoginSuccess({required this.loginResponse});
  final LoginResponse loginResponse;

  @override
  List<Object> get props => [loginResponse];
}

class AuthLoadFailure extends AuthState {
  const AuthLoadFailure({required this.errorMessage});
  final String errorMessage;

  @override
  List<Object> get props => [errorMessage];
}
