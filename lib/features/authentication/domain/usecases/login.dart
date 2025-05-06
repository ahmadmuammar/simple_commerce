import 'package:simple_commerce/core/core.dart';
import 'package:simple_commerce/features/authentication/data/data.dart';
import 'package:simple_commerce/features/authentication/domain/domain.dart';

class Login {
  const Login({required this.datasource});

  final AuthRemoteDatasource datasource;

  Future<Result<LoginResponse, Exception>> call(
    ParamsLogin params,
  ) async {
    final result = await datasource.login(params);
    return result;
  }
}
