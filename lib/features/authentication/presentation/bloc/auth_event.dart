part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthLoginPressed extends AuthEvent {
  const AuthLoginPressed({required this.params});
  final ParamsLogin params;

  @override
  List<Object> get props => [params];
}
