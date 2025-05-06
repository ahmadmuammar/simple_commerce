import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:simple_commerce/core/core.dart';
import 'package:simple_commerce/features/authentication/data/models/login_response.dart';
import 'package:simple_commerce/features/authentication/domain/params/params_login.dart';
import 'package:simple_commerce/features/authentication/domain/usecases/login.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required this.login,
  }) : super(AuthInitial()) {
    on<AuthLoginPressed>(_loginPressed);
  }

  final Login login;

  Future<void> _loginPressed(
    AuthLoginPressed event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoadInProgress());
    final result = await login(event.params);
    switch (result) {
      case Success(value: final loginResponse):
        emit(AuthLoginSuccess(loginResponse: loginResponse));
      case Failure(exception: final exception):
        emit(AuthLoadFailure(errorMessage: exception.toString()));
    }
  }
}
