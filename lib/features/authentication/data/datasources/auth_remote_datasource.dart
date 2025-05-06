import 'package:dio/dio.dart';
import 'package:simple_commerce/core/core.dart';

import 'package:simple_commerce/features/authentication/data/data.dart';
import 'package:simple_commerce/features/authentication/domain/domain.dart';

abstract class AuthRemoteDatasource {
  Future<Result<LoginResponse, Exception>> login(
    ParamsLogin params,
  );
}

class AuthRemoteDatasourceImpl
    with ErrorHandling
    implements AuthRemoteDatasource {
  AuthRemoteDatasourceImpl({required this.dio});

  final Dio dio;

  @override
  Future<Result<LoginResponse, Exception>> login(
    ParamsLogin params,
  ) async {
    try {
      final response = await dio.post(
        'https://fakestoreapi.com/auth/login',
        data: params.toMap(),
      );
      return Success<LoginResponse, Exception>(
        LoginResponse.fromJson(response.data as Map<String, dynamic>),
      );
    } on Exception catch (e) {
      return handleException<LoginResponse>(e);
    }
  }
}
